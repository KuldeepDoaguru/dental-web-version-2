const express = require("express");
const dotenv = require("dotenv");
const bcrypt = require("bcryptjs");
const nodemailer = require("nodemailer");
const { db } = require("../connect");
const JWT = require("jsonwebtoken");
const fs = require("fs");
const path = require("path");
const logger = require("./logger");
const twilio = require("twilio");

dotenv.config();

const ACCOUNT_SID = process.env.ACCOUNT_SID;
const AUTH_TOKEN = process.env.AUTH_TOKEN;
const client = twilio(ACCOUNT_SID, AUTH_TOKEN);

const PORT = process.env.PORT;

const getSittingBill = (req, res) => {
  try {
    const branch = req.params.branch;
    const selectQuery =
      "SELECT * FROM sitting_bill JOIN treatment_package ON treatment_package.tp_id = sitting_bill.tp_id JOIN patient_details ON patient_details.uhid = treatment_package.uhid WHERE sitting_bill.branch_name = ?";
    db.query(selectQuery, branch, (err, result) => {
      if (err) {
        res
          .status(400)
          .json({ success: false, message: "Internal server error" });
      }
      res.status(200).send(result);
    });
  } catch (error) {
    res.status(500).json({ success: false, message: "Internal server error" });
  }
};

const getLabDetails = (req, res) => {
  try {
    const { tpid } = req.params;

    // Fetch data from the MySQL table based on tpid
    const sql = `SELECT * FROM patient_lab_details WHERE tpid = ?`;

    db.query(sql, tpid, (err, results) => {
      if (err) {
        // logger.registrationLogger.log(
        //   "error",
        //   "An error occurred while fetching data"
        // );
        res.status(400).json({ success: false, message: err.message });
      } else {
        // logger.registrationLogger.log(
        //   "info",
        //   "lab details fetched successfully"
        // );
        res.status(200).send(results);
      }
    });
  } catch (error) {
    // logger.registrationLogger.log("error", "internal server error");
    console.error("Error fetching lab details:", error);
    res
      .status(500)
      .json({ error: "Failed to fetch lab details from database" });
  }
};

const getSittingBillDueBySittingId = (req, res) => {
  try {
    const { branch, sbid, tpid, treatment } = req.params;
    const selectQuery =
      "SELECT * FROM sitting_bill JOIN treatment_package ON treatment_package.tp_id = sitting_bill.tp_id JOIN patient_details ON patient_details.uhid = treatment_package.uhid WHERE sitting_bill.branch_name = ? AND sitting_bill.sitting_number = ? AND sitting_bill.tp_id = ? AND sitting_bill.treatment = ?";
    db.query(selectQuery, [branch, sbid, tpid, treatment], (err, result) => {
      if (err) {
        res.status(400).json({ success: false, message: err.message });
      }
      res.status(200).send(result);
    });
  } catch (error) {
    res.status(500).json({ success: false, message: "Internal server error" });
  }
};

const getDentalDataByTpid = (req, res) => {
  const tpid = req.params.tpid;
  const branch = req.params.branch;

  const sql =
    "SELECT * FROM dental_examination WHERE tp_id = ? AND branch_name = ?";
  db.query(sql, [tpid, branch], (err, result) => {
    if (err) {
      console.error("Error retrieving data: ", err);
      res.status(500).send("Error retrieving data: " + err.message);
      return;
    }

    if (result.length === 0) {
      res.status(404).send("No data found for appointment ID: " + tpid);
      return;
    }

    res.status(200).json(result);
  });
};

const prescriptionOnMail = (req, res) => {
  try {
    const { email, patient_name, subject, textMatter } = req.body;
    const pdfPath = req.file.path;
    const transporter = nodemailer.createTransport({
      service: "Gmail",
      auth: {
        user: process.env.EMAILSENDER,
        pass: process.env.EMAILPASSWORD,
      },
    });

    const mailOptions = {
      from: process.env.EMAILSENDER,
      to: email,
      subject: subject,
      text: textMatter,
      attachments: [
        {
          filename: "prescription.pdf",
          path: pdfPath,
          contentType: "application/pdf",
        },
      ],
    };

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.error(error);
        return res
          .status(500)
          .json("An error occurred while sending the email.");
      } else {
        console.log("OTP sent:", info.response);
      }
    });
  } catch (error) {
    res.status(500).json({ success: false, message: "internal server error" });
  }
};

const sendWhatsapp = async (req, res) => {
  const { phoneNumber, message } = req.body;
  const mediaFile = req.file;
  console.log("1018", mediaFile?.filename);

  if (!phoneNumber || !message || !mediaFile) {
    return res
      .status(400)
      .json({ success: false, message: "All fields required" });
  }
  console.log("1019", mediaFile, phoneNumber, message);
  const fileUrl = `http://localhost:8888/prescription/${mediaFile.filename}`;
  console.log("1027", fileUrl);
  try {
    const response = await client.messages.create({
      body: message,
      from: process.env.TWILIONUMBERWHATSAPP,
      mediaUrl: [fileUrl],
      to: `whatsapp:+91${phoneNumber}`,
    });
    console.log("1027", response.body);
    console.log("WhatsApp message sent successfully:", response.sid);
    res.send("WhatsApp message sent successfully");
  } catch (error) {
    console.error("Error sending WhatsApp message:", error);
    res.status(500).send("Error sending WhatsApp message");
  }
};

const sendSMS = async (req, res) => {
  const { phoneNumber, message } = req.body;

  try {
    await client.messages.create({
      from: process.env.TWILIONUMBER,
      to: "+91" + phoneNumber,
      body: message,
    });
    res.send("Message sent successfully!");
    console.log("Message has been sent");
  } catch (error) {
    console.error("Error sending SMS:", error);
    res.status(500).send("Error sending SMS");
  }
};

module.exports = {
  getSittingBill,
  getLabDetails,
  getSittingBillDueBySittingId,
  getDentalDataByTpid,
  prescriptionOnMail,
  sendWhatsapp,
  sendSMS,
};
