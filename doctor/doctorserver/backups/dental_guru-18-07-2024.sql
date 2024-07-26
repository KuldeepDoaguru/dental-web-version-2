/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: appointment_notification
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `appointment_notification` (
  `notify_id` int(100) NOT NULL AUTO_INCREMENT,
  `notification_tag` varchar(100) DEFAULT NULL,
  `notification_msg` varchar(100) DEFAULT NULL,
  `sms` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`notify_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 15 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: appointments
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `appointments` (
  `appoint_id` int(255) NOT NULL AUTO_INCREMENT,
  `patient_uhid` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `tp_id` int(100) DEFAULT NULL,
  `assigned_doctor_name` varchar(255) DEFAULT NULL,
  `assigned_doctor_id` varchar(50) NOT NULL,
  `appointment_dateTime` varchar(255) NOT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `cancel_reason` varchar(1000) DEFAULT NULL,
  `treatment_provided` varchar(255) DEFAULT NULL,
  `appointment_created_by` varchar(255) DEFAULT NULL,
  `appointment_created_by_emp_id` varchar(50) DEFAULT NULL,
  `appointment_updated_by` varchar(50) DEFAULT NULL,
  `appointment_updated_by_emp_id` varchar(50) DEFAULT NULL,
  `appointment_status` varchar(255) DEFAULT NULL,
  `opd_amount` varchar(50) DEFAULT NULL,
  `payment_Mode` varchar(50) DEFAULT NULL,
  `transaction_Id` varchar(50) DEFAULT NULL,
  `payment_Status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`appoint_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 125 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: branches
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `branches` (
  `branch_id` int(255) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) DEFAULT NULL,
  `branch_email` varchar(100) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `hospital_id` varchar(255) DEFAULT NULL,
  `branch_address` varchar(255) DEFAULT NULL,
  `branch_contact` varchar(255) DEFAULT NULL,
  `open_time` time(6) DEFAULT NULL,
  `close_time` time(6) DEFAULT NULL,
  `appoint_slot_duration` varchar(100) DEFAULT NULL,
  `week_off` varchar(100) DEFAULT NULL,
  `head_img` varchar(100) DEFAULT NULL,
  `foot_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: clinic_prescription
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `clinic_prescription` (
  `pr_id` int(100) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) DEFAULT NULL,
  `medicine_name` varchar(100) DEFAULT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  `frequency` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pr_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 16 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dental_examination
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dental_examination` (
  `exm_id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_id` int(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) NOT NULL,
  `patient_uhid` varchar(50) DEFAULT NULL,
  `selected_teeth` varchar(255) DEFAULT NULL,
  `disease` varchar(255) DEFAULT NULL,
  `chief_complain` varchar(255) DEFAULT NULL,
  `advice` varchar(255) DEFAULT NULL,
  `on_examination` varchar(255) DEFAULT NULL,
  `diagnosis_category` varchar(100) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`exm_id`),
  KEY `appointment_id` (`appointment_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 99 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dental_prescription
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dental_prescription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appoint_id` int(11) NOT NULL,
  `tp_id` int(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `patient_uhid` varchar(50) NOT NULL,
  `desease` varchar(100) DEFAULT NULL,
  `treatment` varchar(100) DEFAULT NULL,
  `sitting_number` int(100) DEFAULT NULL,
  `medicine_name` varchar(255) NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `appoint_id` (`appoint_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 60 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dental_treatment
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dental_treatment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `tp_id` int(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) NOT NULL,
  `sitting_number` int(100) DEFAULT NULL,
  `patient_uhid` varchar(50) NOT NULL,
  `dental_treatment` varchar(500) NOT NULL,
  `no_teeth` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `cost_amt` varchar(255) NOT NULL,
  `original_cost_amt` varchar(255) NOT NULL,
  `disc_amt` varchar(255) NOT NULL,
  `total_amt` varchar(255) NOT NULL,
  `net_amount` int(100) DEFAULT NULL,
  `paid_amount` int(100) DEFAULT NULL,
  `pending_amount` int(100) DEFAULT NULL,
  `dir_rec_amt` int(100) DEFAULT NULL,
  `sec_rec_amt` int(100) DEFAULT NULL,
  `dir_rec_doctor_id` varchar(100) DEFAULT NULL,
  `sitting_payment_status` varchar(100) DEFAULT NULL,
  `note` varchar(1000) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `exam_id` (`exam_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 144 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: drugs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `drugs` (
  `drug_id` int(100) NOT NULL AUTO_INCREMENT,
  `HSN_code` varchar(100) DEFAULT NULL,
  `item_code` varchar(100) DEFAULT NULL,
  `drug_name` varchar(100) DEFAULT NULL,
  `drug_strength` varchar(100) DEFAULT NULL,
  `instruction` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`drug_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: employee_attendance
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `employee_attendance` (
  `attendance_id` int(255) NOT NULL AUTO_INCREMENT,
  `employee_ID` varchar(255) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `employee_designation` varchar(255) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `morning_shift_login_time` time(6) DEFAULT NULL,
  `morning_shift_logout_time` time(6) DEFAULT NULL,
  `evening_shift_login_time` time(6) DEFAULT NULL,
  `evening_shift_logout_time` time(6) DEFAULT NULL,
  `allday_shift_login_time` time(6) DEFAULT NULL,
  `allday_shift_logout_time` time(6) DEFAULT NULL,
  `availability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 47 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: employee_complaints
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `employee_complaints` (
  `complain_id` int(255) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(255) DEFAULT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `complain` varchar(255) DEFAULT NULL,
  `rec_on` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `solved_on` datetime(6) DEFAULT NULL,
  `pending_since` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`complain_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: employee_leave
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `employee_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(50) DEFAULT NULL,
  `employee_ID` varchar(11) NOT NULL,
  `employee_name` varchar(50) DEFAULT NULL,
  `leave_dates` varchar(1000) NOT NULL,
  `leave_reason` varchar(1000) DEFAULT NULL,
  `leave_status` varchar(50) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 59 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: employee_register
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `employee_register` (
  `sr_id` int(255) NOT NULL AUTO_INCREMENT,
  `employee_ID` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `employee_mobile` varchar(255) DEFAULT NULL,
  `employee_email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `employee_designation` varchar(255) DEFAULT NULL,
  `employee_password` varchar(255) DEFAULT NULL,
  `employee_role` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `employee_status` varchar(255) DEFAULT NULL,
  `morning_shift_start_time` time(6) DEFAULT NULL,
  `morning_shift_end_time` time(6) DEFAULT NULL,
  `evening_shift_start_time` time(6) DEFAULT NULL,
  `evening_shift_end_time` time(6) DEFAULT NULL,
  `allday_shift_start_time` time(6) DEFAULT NULL,
  `allday_shift_end_time` time(6) DEFAULT NULL,
  `working_days` varchar(255) DEFAULT NULL,
  `availability` varchar(255) DEFAULT NULL,
  `employee_picture` varchar(255) DEFAULT NULL,
  `employee_education` varchar(255) DEFAULT NULL,
  `speciality` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `experience` varchar(100) DEFAULT NULL,
  `type_of` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sr_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: employee_timeline
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `employee_timeline` (
  `event_id` int(100) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `event_msg` varchar(100) DEFAULT NULL,
  `open` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `time` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`event_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: examin_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `examin_details` (
  `examin_id` int(255) NOT NULL AUTO_INCREMENT,
  `uhid` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `examin_date` datetime(6) DEFAULT NULL,
  `examin_issue` varchar(255) DEFAULT NULL,
  `examin_investigation` varchar(255) DEFAULT NULL,
  `tooth` varchar(255) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `doctor_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`examin_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: expense_voucher
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `expense_voucher` (
  `voucher_id` int(100) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) DEFAULT NULL,
  `for_name` varchar(100) DEFAULT NULL,
  `for_use` varchar(100) DEFAULT NULL,
  `voucher_amount` int(100) DEFAULT NULL,
  `voucher_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: holidays
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `holidays` (
  `holiday_id` int(100) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) DEFAULT NULL,
  `holiday_name` varchar(255) DEFAULT NULL,
  `holiday_date` date DEFAULT NULL,
  `holiday_start_time` time(6) DEFAULT NULL,
  `holiday_end_time` time(6) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`holiday_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 17 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: inquiries
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `inquiries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `doctorId` varchar(11) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 25 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: lab_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `lab_details` (
  `lab_id` int(255) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) DEFAULT NULL,
  `lab_name` varchar(255) DEFAULT NULL,
  `lab_type` varchar(255) DEFAULT NULL,
  `lab_contact` varchar(255) DEFAULT NULL,
  `lab_email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lab_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: lab_tests
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `lab_tests` (
  `lab_tid` int(100) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(100) DEFAULT NULL,
  `test_code` varchar(100) DEFAULT NULL,
  `waiting_days` varchar(100) DEFAULT NULL,
  `default_lab` varchar(100) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `test_cost` int(100) DEFAULT NULL,
  PRIMARY KEY (`lab_tid`)
) ENGINE = InnoDB AUTO_INCREMENT = 30 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: otpcollections
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `otpcollections` (
  `otp_id` int(100) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `code` int(10) DEFAULT NULL,
  `expiresIn` int(20) DEFAULT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`otp_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: patient_bills
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `patient_bills` (
  `bill_id` int(255) NOT NULL AUTO_INCREMENT,
  `bill_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `uhid` varchar(255) DEFAULT NULL,
  `tp_id` int(11) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `patient_mobile` varchar(255) DEFAULT NULL,
  `patient_email` varchar(255) DEFAULT NULL,
  `assigned_doctor_name` varchar(255) DEFAULT NULL,
  `total_amount` int(255) DEFAULT NULL,
  `paid_amount` int(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_date_time` datetime(6) DEFAULT NULL,
  `receiver_name` varchar(100) DEFAULT NULL,
  `receiver_emp_id` varchar(100) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `transaction_Id` varchar(255) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pay_by_sec_amt` int(100) DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: patient_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `patient_details` (
  `uhid` varchar(100) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `initialid` varchar(100) DEFAULT NULL,
  `patient_name` varchar(255) NOT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `age` varchar(11) NOT NULL,
  `weight` varchar(11) DEFAULT NULL,
  `gender` varchar(100) NOT NULL,
  `maritalstatus` varchar(100) DEFAULT NULL,
  `bloodgroup` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) NOT NULL,
  `alternatecontactno` varchar(100) DEFAULT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `allergy` varchar(255) DEFAULT NULL,
  `disease` varchar(1000) DEFAULT NULL,
  `isstaff` varchar(100) DEFAULT NULL,
  `staffempid` varchar(100) DEFAULT NULL,
  `staffrelationid` varchar(100) DEFAULT NULL,
  `isforeign` varchar(100) DEFAULT NULL,
  `isvip` varchar(100) DEFAULT NULL,
  `fathername` varchar(100) DEFAULT NULL,
  `husbandname` varchar(100) DEFAULT NULL,
  `mothername` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `patient_type` varchar(255) DEFAULT NULL,
  `aadhaar_no` varchar(100) DEFAULT NULL,
  `patient_added_by` varchar(50) DEFAULT NULL,
  `patient_updated_by` varchar(50) DEFAULT NULL,
  `patient_added_by_emp_id` varchar(50) DEFAULT NULL,
  `patient_updated_by_emp_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`uhid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: patient_disease
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `patient_disease` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: patient_lab_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `patient_lab_details` (
  `testid` int(11) NOT NULL AUTO_INCREMENT,
  `tpid` int(11) DEFAULT NULL,
  `patient_uhid` varchar(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `assigned_doctor_name` varchar(255) NOT NULL,
  `lab_name` varchar(255) NOT NULL,
  `test` varchar(255) NOT NULL,
  `test_status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`testid`)
) ENGINE = InnoDB AUTO_INCREMENT = 37 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: patient_lab_test_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `patient_lab_test_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testid` int(11) NOT NULL,
  `patient_uhid` varchar(255) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `test` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `collection_date` date DEFAULT NULL,
  `authenticate_date` date DEFAULT NULL,
  `payment` decimal(10, 0) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `lab_type` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `testid` (`testid`),
  CONSTRAINT `patient_lab_test_details_ibfk_1` FOREIGN KEY (`testid`) REFERENCES `patient_lab_details` (`testid`)
) ENGINE = InnoDB AUTO_INCREMENT = 41 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: patient_test_notes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `patient_test_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_text` varchar(255) NOT NULL,
  `testid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test_id` (`testid`)
) ENGINE = InnoDB AUTO_INCREMENT = 25 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: patient_timeline
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `patient_timeline` (
  `event_id` int(100) NOT NULL AUTO_INCREMENT,
  `event_date` timestamp NULL DEFAULT current_timestamp(),
  `event_time` time(6) DEFAULT current_timestamp(),
  `event_type` varchar(100) DEFAULT NULL,
  `event_description` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `uhid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1224 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: payment_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `payment_details` (
  `pay_id` int(100) NOT NULL AUTO_INCREMENT,
  `bill_id` int(100) DEFAULT NULL,
  `uhid` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `bill_amount` int(100) DEFAULT NULL,
  `paid_amount` int(100) DEFAULT NULL,
  `pending_amount` int(100) DEFAULT NULL,
  `billed_service` varchar(255) DEFAULT NULL,
  `payment_mode` varchar(100) DEFAULT NULL,
  `payment_status` varchar(100) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_time` time(6) DEFAULT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: prescription_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `prescription_details` (
  `prescription_id` int(100) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) DEFAULT NULL,
  `uhid` varchar(100) DEFAULT NULL,
  `doctor_id` varchar(100) DEFAULT NULL,
  `doctor_name` varchar(100) DEFAULT NULL,
  `medicine_name` varchar(100) DEFAULT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  `frequency` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `prescription_date` date DEFAULT NULL,
  PRIMARY KEY (`prescription_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: purchase_inventory
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `purchase_inventory` (
  `pur_id` int(255) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `item_category` varchar(255) DEFAULT NULL,
  `item_mrp` varchar(255) DEFAULT NULL,
  `item_code` varchar(255) DEFAULT NULL,
  `HSN_code` varchar(255) DEFAULT NULL,
  `pur_quantity` int(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `available_stock` int(255) DEFAULT NULL,
  `low_stock_threshhold` int(255) DEFAULT NULL,
  `distributor_name` varchar(255) DEFAULT NULL,
  `distributor_number` varchar(255) DEFAULT NULL,
  `bill_receipt_doc` varchar(255) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  PRIMARY KEY (`pur_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 23 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: security_amount
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `security_amount` (
  `sa_id` int(100) NOT NULL AUTO_INCREMENT,
  `tp_id` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `appointment_id` int(100) DEFAULT NULL,
  `uhid` varchar(100) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `patient_number` varchar(100) DEFAULT NULL,
  `treatment` varchar(255) DEFAULT NULL,
  `assigned_doctor` varchar(100) DEFAULT NULL,
  `amount` int(100) DEFAULT NULL,
  `remaining_amount` int(100) DEFAULT NULL,
  `payment_status` varchar(100) DEFAULT NULL,
  `payment_Mode` varchar(50) DEFAULT NULL,
  `transaction_Id` varchar(50) DEFAULT NULL,
  `payment_date` varchar(50) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `refund_amount` int(100) DEFAULT NULL,
  `refund_date` datetime(6) DEFAULT NULL,
  `received_by` varchar(100) DEFAULT NULL,
  `refund_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sa_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 32 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: staff_salary
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `staff_salary` (
  `sl_id` int(100) NOT NULL AUTO_INCREMENT,
  `employee_ID` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `payable_salary` varchar(100) DEFAULT NULL,
  `paid_salary` varchar(100) DEFAULT NULL,
  `due_salary` varchar(100) DEFAULT NULL,
  `advance_payment` varchar(100) DEFAULT NULL,
  `pay_date` datetime(6) DEFAULT NULL,
  `pay_status` varchar(100) DEFAULT NULL,
  `pay_month` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: super_admin
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `super_admin` (
  `sa_id` int(255) NOT NULL AUTO_INCREMENT,
  `hospital_id` varchar(255) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `super_name` varchar(255) DEFAULT NULL,
  `super_email` varchar(255) DEFAULT NULL,
  `super_mobile` varchar(255) DEFAULT NULL,
  `super_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sa_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: treat_procedure_list
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `treat_procedure_list` (
  `treat_procedure_id` int(100) NOT NULL AUTO_INCREMENT,
  `treat_procedure_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`treat_procedure_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: treat_suggest
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `treat_suggest` (
  `ts_id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_id` int(100) DEFAULT NULL,
  `appoint_id` int(11) NOT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `p_uhid` varchar(255) NOT NULL,
  `desease` varchar(100) DEFAULT NULL,
  `treatment_name` varchar(255) DEFAULT NULL,
  `totalCost` varchar(255) DEFAULT NULL,
  `discount` int(100) DEFAULT NULL,
  `paid_amount` int(100) DEFAULT NULL,
  `treatment_status` varchar(255) DEFAULT NULL,
  `consider_sitting` varchar(255) DEFAULT NULL,
  `total_sitting` varchar(255) DEFAULT NULL,
  `current_sitting` int(100) DEFAULT NULL,
  `upcoming_sitting` int(100) DEFAULT NULL,
  `appoint_date` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `current_sitting_status` varchar(100) DEFAULT NULL,
  `upcoming_sitting_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ts_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 75 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: treatment_list
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `treatment_list` (
  `treatment_id` int(255) NOT NULL AUTO_INCREMENT,
  `treatment_name` varchar(255) DEFAULT NULL,
  `treatment_cost` varchar(255) DEFAULT NULL,
  `treatment_discount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`treatment_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: treatment_list_copy
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `treatment_list_copy` (
  `treatment_id` int(255) NOT NULL AUTO_INCREMENT,
  `treat_procedure_id` int(100) DEFAULT NULL,
  `treat_procedure_name` varchar(100) DEFAULT NULL,
  `treatment_name` varchar(1000) DEFAULT NULL,
  `treatment_cost` varchar(255) DEFAULT NULL,
  `treatment_discount` varchar(255) DEFAULT NULL,
  `value` varchar(1000) NOT NULL,
  `label` varchar(1000) NOT NULL,
  PRIMARY KEY (`treatment_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 55 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: treatment_package
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `treatment_package` (
  `tp_id` int(100) NOT NULL AUTO_INCREMENT,
  `uhid` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `appointment_id` int(100) DEFAULT NULL,
  `examination_id` int(100) DEFAULT NULL,
  `doctor_id` varchar(100) DEFAULT NULL,
  `doctor_name` varchar(100) NOT NULL,
  `package_status` varchar(50) DEFAULT NULL,
  `diagnosis_category` varchar(100) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`tp_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 113 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: appointment_notification
# ------------------------------------------------------------

INSERT INTO
  `appointment_notification` (
    `notify_id`,
    `notification_tag`,
    `notification_msg`,
    `sms`,
    `email`,
    `whatsapp`
  )
VALUES
  (
    1,
    'appointment 2',
    'confirm ',
    'enable',
    'enable',
    'enable'
  );
INSERT INTO
  `appointment_notification` (
    `notify_id`,
    `notification_tag`,
    `notification_msg`,
    `sms`,
    `email`,
    `whatsapp`
  )
VALUES
  (
    2,
    'Patient Appointment Reshedule',
    'Sms! Sent to patient on reshedule an appointment',
    'disable',
    'enable',
    'enable'
  );
INSERT INTO
  `appointment_notification` (
    `notify_id`,
    `notification_tag`,
    `notification_msg`,
    `sms`,
    `email`,
    `whatsapp`
  )
VALUES
  (
    3,
    'Patient Appointment Reminder',
    'Sms! Sent to patient on the day of appointment at 8am',
    'disable',
    'enable',
    'enable'
  );
INSERT INTO
  `appointment_notification` (
    `notify_id`,
    `notification_tag`,
    `notification_msg`,
    `sms`,
    `email`,
    `whatsapp`
  )
VALUES
  (
    4,
    'Doctor Appointment Confirmation',
    'Sms! Sent to Doctor on adding a new appointment',
    'disable',
    'enable',
    'enable'
  );
INSERT INTO
  `appointment_notification` (
    `notify_id`,
    `notification_tag`,
    `notification_msg`,
    `sms`,
    `email`,
    `whatsapp`
  )
VALUES
  (
    5,
    'Doctor Appointment Reshedule',
    'Sms! Sent to Doctor on reshedule an appointment',
    'disable',
    'enable',
    'enable'
  );
INSERT INTO
  `appointment_notification` (
    `notify_id`,
    `notification_tag`,
    `notification_msg`,
    `sms`,
    `email`,
    `whatsapp`
  )
VALUES
  (
    7,
    'Patient Birthday',
    'Hi Patient, Dental Guru Wishes you a very happy birthday,                       stay happy and healt',
    'disable',
    'disable',
    'disable'
  );
INSERT INTO
  `appointment_notification` (
    `notify_id`,
    `notification_tag`,
    `notification_msg`,
    `sms`,
    `email`,
    `whatsapp`
  )
VALUES
  (
    8,
    'Patient Welcome',
    'Dear Patient, Thank you for visiting Dental guru clinic, you                       can reach us at 9',
    'disable',
    'disable',
    'disable'
  );
INSERT INTO
  `appointment_notification` (
    `notify_id`,
    `notification_tag`,
    `notification_msg`,
    `sms`,
    `email`,
    `whatsapp`
  )
VALUES
  (
    9,
    'Patient Followup',
    'Dear Patient, your appointment is due at Dental guru clinic                       date 25 oct 2023 a',
    'disable',
    'disable',
    'disable'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: appointments
# ------------------------------------------------------------

INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-01 09:00:00',
    '-',
    NULL,
    'OPD',
    'Nurse Jane',
    '201',
    'Nurse Jane',
    '201',
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-01 11:16:45'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    '789012',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-01 10:30:00',
    'Fever',
    NULL,
    'OPD',
    'Front Desk Receptionist',
    '202',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-01 11:16:45'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    6,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-25T11:00',
    'sg',
    NULL,
    'Dental Cleanings',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Complete',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-06 16:51:08',
    '2024-04-06 16:51:08'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    7,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-25T11:00',
    'sg',
    NULL,
    'Dental Cleanings',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-06 16:52:04',
    '2024-04-06 16:52:04'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    8,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-10T15:00',
    'fsfdf',
    NULL,
    'Dental Cleanings',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-06 17:03:15',
    '2024-05-10 21:21:36'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    9,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-09T11:15',
    'cgf',
    NULL,
    'Dental Cleanings',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-06 17:04:36',
    '2024-04-06 17:04:36'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    10,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-10T10:30',
    'aatu beta',
    NULL,
    'Crowns (Caps)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-06 21:10:31',
    '2024-04-06 21:10:31'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    11,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-09T10:45',
    'aatu beta',
    NULL,
    'Fluoride Treatments',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-06 21:27:55',
    '2024-04-06 21:27:55'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    12,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-10T11:30',
    'hghgv',
    NULL,
    'Apicoectomy (Endodontic Surgery)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-06 21:43:03',
    '2024-04-06 21:43:03'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    13,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-10T11:15',
    'cgsdgg',
    NULL,
    'Dental Cleanings',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-08 10:46:43',
    '2024-04-08 10:46:43'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    14,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-10T10:45',
    'lalala',
    NULL,
    'Dental Cleanings',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-08 15:50:42',
    '2024-04-08 15:50:42'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    15,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-12T11:00',
    'test',
    NULL,
    'Fluoride Treatments',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-11 16:35:23',
    '2024-04-11 16:35:23'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    16,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-13T11:00',
    'test-2',
    NULL,
    'Fluoride Treatments',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-11 16:58:17',
    '2024-04-11 16:58:17'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    17,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-13Tundefined',
    'dffgfg',
    NULL,
    'Fluoride Treatments',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-11 18:52:01',
    '2024-04-11 18:52:01'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    18,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-13T13:30',
    'test-3',
    NULL,
    'Fluoride Treatments',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-11 18:52:35',
    '2024-04-11 18:52:35'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    19,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-13T11:15',
    'test-4',
    NULL,
    'Fluoride Treatments',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-11 18:53:33',
    '2024-04-11 18:53:33'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    20,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-19T11:00',
    'test-5',
    NULL,
    'Fluoride Treatments',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-11 18:59:17',
    '2024-04-11 18:59:17'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    21,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-12T10:15',
    'test-6',
    NULL,
    'Fluoride Treatments',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-11 19:04:06',
    '2024-04-11 19:04:06'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    29,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-23Tundefined',
    '',
    NULL,
    'Bridges',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-11 21:05:40',
    '2024-04-11 21:05:40'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    30,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-24T11:15',
    '',
    NULL,
    'Bridges',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-11 21:07:12',
    '2024-04-24 18:48:04'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    31,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-19T14:15',
    '',
    NULL,
    'Bridges',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-11 21:07:59',
    '2024-04-11 21:07:59'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    32,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-12T10:45',
    '',
    NULL,
    'Bridges',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-11 21:11:22',
    '2024-04-11 21:11:22'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    33,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-26T10:45',
    '',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-13 12:52:53',
    '2024-04-26 16:12:19'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    34,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-20T10:30',
    '',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-13 12:56:07',
    '2024-04-13 12:56:07'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    35,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-19T10:45',
    '',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-13 12:58:11',
    '2024-04-13 12:58:11'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    36,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-26T11:00',
    '',
    NULL,
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-13 19:27:51',
    '2024-04-26 10:45:36'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    37,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-16T10:30',
    '',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-15 14:02:58',
    '2024-04-15 14:02:58'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    38,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-19T19:30',
    'dchdfh',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-18 13:12:07',
    '2024-04-18 13:12:07'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    39,
    '123456',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-20T11:00',
    'test',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-19 13:23:33',
    '2024-04-19 13:23:33'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    40,
    '123456',
    'Madan Mahal',
    30,
    'shadab',
    'dg_4',
    '2024-04-23T11:00',
    'test to check tpid',
    NULL,
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-19 21:06:24',
    '2024-04-19 21:06:24'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    41,
    '789012',
    'Madan Mahal',
    33,
    'shadab',
    'dg_4',
    '2024-04-25T11:30',
    '',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-20 21:11:18',
    '2024-04-20 21:11:18'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    42,
    '123456',
    'Madan Mahal',
    39,
    'shadab',
    'dg_4',
    '2024-04-26T12:00',
    '',
    'sss',
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Cancel',
    NULL,
    NULL,
    NULL,
    'Refund',
    '2024-04-24 13:41:24',
    '2024-04-26 16:15:00'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    43,
    '123456',
    'Madan Mahal',
    39,
    'shadab',
    'dg_4',
    '2024-04-27T11:30',
    '',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'in treatment',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-24 13:56:51',
    '2024-04-24 13:56:51'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    44,
    '123456',
    'Madan Mahal',
    39,
    'shadab',
    'dg_4',
    '2024-04-27T12:15',
    '',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-24 13:59:05',
    '2024-04-24 13:59:05'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    45,
    '123456',
    'Madan Mahal',
    39,
    'shadab',
    'dg_4',
    '2024-04-26T11:30',
    '',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-24 14:15:10',
    '2024-04-24 14:15:10'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    46,
    'DH_15',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-24T10:15',
    'no',
    NULL,
    'Laminates and Veneers@ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'ongoing',
    '0',
    '',
    '',
    '',
    '2024-04-24 15:58:55',
    '2024-04-24 18:47:12'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    47,
    'DH_20',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-25T14:00',
    'no',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-24 16:03:50',
    '2024-04-25 14:28:52'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    48,
    '123456',
    'Madan Mahal',
    39,
    'shadab',
    'dg_4',
    '2024-04-29T10:15',
    '',
    NULL,
    'Re-Root Canal Treatlment @ per tooth',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Complete',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-24 16:34:30',
    '2024-04-24 16:34:30'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    49,
    '123456',
    'Madan Mahal',
    42,
    'shadab',
    'dg_4',
    '2024-04-24T18:00',
    '',
    NULL,
    'Biopsy',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'ongoing',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-24 17:40:57',
    '2024-04-24 17:40:57'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    50,
    'DH_21',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-24T18:15',
    '',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'ongoing',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-24 18:05:16',
    '2024-04-24 18:52:05'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    51,
    'DH_21',
    'Madan Mahal',
    NULL,
    'shubham',
    'dg_1',
    '2024-04-25T10:15',
    '',
    NULL,
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Appoint',
    '0',
    '',
    '',
    '',
    '2024-04-24 18:15:42',
    '2024-04-25 19:08:52'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    52,
    'DH_22',
    'Madan Mahal',
    NULL,
    'shubham',
    'dg_1',
    '2024-04-24T10:15',
    '2ws2',
    'asfse',
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Cancel',
    '500',
    'online',
    'aesdsr',
    'Refund',
    '2024-04-24 18:26:59',
    '2024-04-24 18:37:05'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    53,
    'DH_21',
    'Madan Mahal',
    43,
    'shadab',
    'dg_4',
    '2024-04-24T19:45',
    '',
    'none',
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Cancel',
    '0',
    '',
    '',
    '',
    '2024-04-24 19:23:40',
    '2024-04-24 19:25:03'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    54,
    'DH_23',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-24T19:45',
    'no',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-24 20:01:43',
    '2024-04-24 20:02:04'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    55,
    'DH_23',
    'Madan Mahal',
    45,
    'shadab',
    'dg_4',
    '2024-04-24T19:30',
    '2',
    NULL,
    'Re-Root Canal Treatlment @ per tooth',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'in treatment',
    '0',
    '',
    '',
    '',
    '2024-04-24 20:14:28',
    '2024-04-24 20:14:28'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    56,
    'DH_24',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-25T12:00',
    '',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '505',
    'cash',
    '',
    'paid',
    '2024-04-25 11:11:50',
    '2024-04-25 14:16:08'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    57,
    'DH_25',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-25T11:30',
    'done',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-25 11:41:50',
    '2024-04-25 11:46:58'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    58,
    'DH_10',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-25T14:30',
    'treatment kar ke de be',
    NULL,
    'Laminates and Veneers@ per tooth',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    '0',
    '',
    '',
    '',
    '2024-04-25 12:02:18',
    '2024-04-25 12:02:18'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    59,
    'DH_20',
    'Madan Mahal',
    53,
    'shadab',
    'dg_4',
    '2024-04-25T15:00',
    '',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-25 14:36:54',
    '2024-04-25 14:40:43'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    60,
    'DH_20',
    'Madan Mahal',
    57,
    'shadab',
    'dg_4',
    '2024-04-25T19:30',
    'close',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'in treatment',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-25 14:58:56',
    '2024-04-25 14:58:56'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    61,
    'DH_12',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-25T19:00',
    'test',
    NULL,
    'Amalgam Restoration@ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '0',
    '',
    '',
    '',
    '2024-04-25 15:22:02',
    '2024-04-25 15:22:17'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    62,
    'DH_26',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-25T14:45',
    'no',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-25 16:09:25',
    '2024-04-25 16:10:06'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    63,
    'DH_17',
    'Madan Mahal',
    NULL,
    'shubham',
    'dg_1',
    '2024-04-25T16:15',
    'no',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    '500',
    'cash',
    '',
    'pending',
    '2024-04-25 18:15:23',
    '2024-04-25 18:15:23'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    64,
    'DH_27',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-26T14:15',
    'with milk',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-26 14:05:54',
    '2024-04-26 14:06:27'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    65,
    'DH_27',
    'Madan Mahal',
    71,
    'shadab',
    'dg_4',
    '2024-04-26T16:45',
    '',
    NULL,
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-26 14:09:40',
    '2024-04-26 19:05:00'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    66,
    '123456',
    'Madan Mahal',
    70,
    'shadab',
    'dg_4',
    '2024-04-27T11:00',
    '',
    NULL,
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'in treatment',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-26 16:23:58',
    '2024-04-26 16:23:58'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    67,
    '123456',
    'Madan Mahal',
    70,
    'shadab',
    'dg_4',
    '2024-04-30T11:00',
    'appoint for 3 sitting',
    NULL,
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Complete',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-26 16:29:46',
    '2024-04-26 16:29:46'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    68,
    '123456',
    'Madan Mahal',
    74,
    'shadab',
    'dg_4',
    '2024-04-30T12:00',
    '',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'in treatment',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-27 13:27:55',
    '2024-04-27 13:27:55'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    69,
    'DH_27',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-01T14:00',
    'test-live',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-27 15:51:35',
    '2024-04-27 15:51:35'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    70,
    'DH_27',
    'Madan Mahal',
    75,
    'shadab',
    'dg_4',
    '2024-05-02Tundefined',
    'test-live',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-27 15:51:35',
    '2024-04-27 15:51:35'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    71,
    'DH_28',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-27T19:15',
    'no',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-27 17:41:24',
    '2024-04-27 17:41:24'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    72,
    'DH_29',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-27T19:00',
    'no',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-27 17:44:50',
    '2024-04-27 17:46:43'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    73,
    NULL,
    'Madan Mahal',
    79,
    'shadab',
    'dg_4',
    '2024-04-29Tundefined',
    'okay',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-27 19:06:21',
    '2024-04-27 19:06:21'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    74,
    NULL,
    'Madan Mahal',
    79,
    'shadab',
    'dg_4',
    '2024-04-29Tundefined',
    'okay',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'in treatment',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-27 19:06:25',
    '2024-04-27 19:06:25'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    75,
    'DH_30',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-27T19:30',
    'no',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-27 19:34:24',
    '2024-04-27 19:37:56'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    76,
    'DH_31',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-27T19:45',
    'no',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-27 19:36:06',
    '2024-04-27 20:15:58'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    77,
    'DH_30',
    'Madan Mahal',
    82,
    'shadab',
    'dg_4',
    '2024-04-29T11:00',
    'DH_30',
    'no reason',
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Cancel',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-04-27 19:55:37',
    '2024-04-27 19:55:37'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    78,
    'DH_32',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-30T10:15',
    'done',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-29 10:49:26',
    '2024-04-29 10:49:26'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    79,
    'DH_33',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-04-29T13:30',
    '122',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '500',
    'cash',
    '',
    'paid',
    '2024-04-29 14:36:49',
    '2024-04-29 16:22:36'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    80,
    'DH_34',
    'Madan Mahal',
    NULL,
    'shubham',
    'dg_1',
    '2024-05-02T17:15',
    'testing',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-02 15:34:54',
    '2024-05-02 15:34:54'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    81,
    'DH_35',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-03T12:50',
    'close',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-03 12:23:29',
    '2024-05-03 12:30:44'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    82,
    'DH_35',
    'Madan Mahal',
    89,
    'shadab',
    'dg_4',
    '2024-05-03T18:20',
    '2nd sitting',
    NULL,
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-03 12:36:08',
    '2024-05-03 12:39:22'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    83,
    'DH_35',
    'Madan Mahal',
    89,
    'shadab',
    'dg_4',
    '2024-05-03T19:40',
    '3rd sitting',
    NULL,
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-03 12:47:34',
    '2024-05-03 12:57:52'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    84,
    'DH_35',
    'Madan Mahal',
    89,
    'shadab',
    'dg_4',
    '2024-05-03T19:50',
    '',
    'lkjkl',
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Cancel',
    NULL,
    NULL,
    NULL,
    'Refund',
    '2024-05-03 12:56:25',
    '2024-05-03 12:57:46'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    85,
    'DH_28',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-06T10:30',
    'new patient',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '0',
    '',
    '',
    '',
    '2024-05-06 12:14:18',
    '2024-05-06 14:16:31'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    86,
    'DH_36',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-06T11:20',
    'test',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-06 12:22:38',
    '2024-05-06 12:23:25'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    87,
    'DH_36',
    'Madan Mahal',
    90,
    'shadab',
    'dg_4',
    '2024-05-07T10:10',
    '1st sitting done',
    NULL,
    'Ceramic Braces',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-06 12:40:18',
    '2024-05-07 11:02:26'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    88,
    'DH_35',
    'Madan Mahal',
    89,
    'shadab',
    'dg_4',
    '2024-05-07T12:30',
    'test oral',
    '',
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Cancel',
    '0',
    '',
    '',
    '',
    '2024-05-07 11:04:10',
    '2024-05-07 11:07:24'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    89,
    'DH_26',
    'Madan Mahal',
    67,
    'shadab',
    'dg_4',
    '2024-05-07T12:30',
    'test bu oral',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-07 11:09:58',
    '2024-05-07 11:10:26'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    90,
    'DH_29',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-07T11:30',
    'demo',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-07 14:12:11',
    '2024-05-07 14:15:11'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    91,
    'DH_29',
    'Madan Mahal',
    93,
    'shadab',
    'dg_4',
    '2024-05-08T10:50',
    'second sitting',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-07 14:20:59',
    '2024-05-08 17:32:40'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    92,
    'DH_15',
    'Madan Mahal',
    NULL,
    'shubham',
    'dg_1',
    '2024-05-09T10:10',
    'Additional notes',
    'none',
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Cancel',
    '500',
    'cash',
    '',
    'Refund',
    '2024-05-08 11:11:17',
    '2024-05-09 19:44:05'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    93,
    'DH_19',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-08T10:10',
    'test ',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-08 12:17:02',
    '2024-05-08 12:17:02'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    94,
    'DH_19',
    'Madan Mahal',
    94,
    'shadab',
    'dg_4',
    '2024-05-09T10:30',
    'test',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Complete',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-08 12:31:48',
    '2024-05-08 12:31:48'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    96,
    '2',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-08T13:20',
    'sdgsadg',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-08 16:47:08',
    '2024-05-08 16:47:29'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    97,
    'DH_25',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-08T10:20',
    'no',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '100',
    'cash',
    '',
    'paid',
    '2024-05-08 17:34:02',
    '2024-05-08 17:34:24'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    98,
    'VH_00',
    'Branch Name',
    0,
    'Dr. Jane Smith',
    'DOC123',
    '2024-05-09T12:00:00',
    'Additional notes',
    NULL,
    'Treatment details',
    'Admin',
    'AdminID',
    NULL,
    NULL,
    'Confirmed',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-09 17:39:28',
    '2024-05-09 17:39:28'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    99,
    'VH_00',
    'Branch Name',
    0,
    'Dr. Jane Smith',
    'DOC123',
    '2024-05-09T12:00:00',
    'Additional notes',
    NULL,
    'Treatment details',
    'Admin',
    'AdminID',
    NULL,
    NULL,
    'Confirmed',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-09 17:50:26',
    '2024-05-09 17:50:26'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    100,
    'VH_22',
    'Branch Name',
    0,
    'Dr. Raj Smith',
    'DOC456',
    '2024-05-09T12:00:00',
    'Additional notes',
    NULL,
    'Treatment details',
    'Admin',
    'AdminID',
    NULL,
    NULL,
    'Confirmed',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-09 18:21:52',
    '2024-05-09 18:21:52'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    101,
    'VH_22',
    'Branch Name',
    0,
    'Dr. Raj Smith',
    'DOC456',
    '2024-05-09T12:00:00',
    'Additional notes',
    NULL,
    'Treatment details',
    'Admin',
    'AdminID',
    NULL,
    NULL,
    'Confirmed',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-09 18:25:06',
    '2024-05-09 18:25:06'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    102,
    'VH_22',
    'Branch Name',
    0,
    'Dr. Raj Smith',
    'DOC456',
    '2024-05-09T12:00:00',
    'Additional notes',
    NULL,
    'Treatment details',
    'Admin',
    'AdminID',
    NULL,
    NULL,
    'Confirmed',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-09 18:29:53',
    '2024-05-09 18:29:53'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    103,
    'DH_19',
    'Madan Mahal',
    94,
    'shadab',
    'dg_4',
    '2024-05-10T15:20',
    'mail testing ',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Complete',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-09 18:31:25',
    '2024-05-09 18:31:25'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    105,
    'DH_19',
    'Madan Mahal',
    94,
    'shadab',
    'dg_4',
    '2024-05-11T13:20',
    'frontend mail',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-09 18:48:49',
    '2024-05-09 18:48:49'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    106,
    'DH_15',
    'Madan Mahal',
    NULL,
    'shubham',
    'dg_1',
    '2024-05-09T13:10',
    'no',
    'none',
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Cancel',
    '0',
    '',
    '',
    'Refund',
    '2024-05-09 18:49:37',
    '2024-05-09 18:53:56'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    108,
    'DH_15',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-10T10:20',
    'no',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '0',
    '',
    '',
    '',
    '2024-05-10 11:39:52',
    '2024-05-10 12:45:09'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    109,
    'DH_15',
    'Madan Mahal',
    NULL,
    'shubham',
    'dg_1',
    '2024-05-10T11:00',
    'no',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    '0',
    '',
    '',
    '',
    '2024-05-10 12:38:29',
    '2024-05-10 12:38:29'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    110,
    'DH_15',
    'Madan Mahal',
    NULL,
    'shubham',
    'dg_1',
    '2024-05-10T12:00',
    'no',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    '0',
    '',
    '',
    '',
    '2024-05-10 12:38:57',
    '2024-05-10 12:38:57'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    111,
    'DH_37',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-10T17:30',
    'close',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Check-In',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-10 17:01:26',
    '2024-05-10 17:32:50'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    112,
    'DH_37',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-13T10:10',
    'testing',
    'm ni btaunga',
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Cancel',
    '500',
    'cash',
    '',
    'Refund',
    '2024-05-10 17:11:26',
    '2024-05-10 17:32:06'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    113,
    'DH_15',
    'Madan Mahal',
    99,
    'shubham',
    'dg_1',
    '2024-05-11T12:20',
    'no',
    NULL,
    'Pulpectomy (Child) @ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Appoint',
    '0',
    '',
    '',
    '',
    '2024-05-10 21:03:43',
    '2024-05-10 21:04:23'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    114,
    'DH_14',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-11T10:10',
    'no',
    NULL,
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'in treatment',
    '0',
    '',
    '',
    '',
    '2024-05-10 21:04:59',
    '2024-05-11 19:33:36'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    115,
    'DH_38',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-11T12:40',
    'DSDEF',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-11 12:37:42',
    '2024-05-11 12:39:38'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    116,
    'DH_39',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-11T13:00',
    'SFCE',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-11 12:49:21',
    '2024-05-11 12:56:48'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    117,
    'DH_38',
    'Madan Mahal',
    101,
    'shadab',
    'dg_4',
    '2024-05-11T17:40',
    'CCc',
    NULL,
    'Root Canal Treatment @ per tooth',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-11 12:51:28',
    '2024-05-11 12:51:28'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    118,
    'DH_39',
    'Madan Mahal',
    102,
    'shadab',
    'dg_4',
    '2024-05-11T19:00',
    'SSXS',
    NULL,
    'Ceramic Braces',
    'shadab',
    'dg_4',
    NULL,
    NULL,
    'Appoint',
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-11 13:03:22',
    '2024-05-11 13:03:22'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    119,
    'DH_40',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-11T19:10',
    'EFE',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-11 13:25:28',
    '2024-05-11 15:39:25'
  );
INSERT INTO
  `appointments` (
    `appoint_id`,
    `patient_uhid`,
    `branch_name`,
    `tp_id`,
    `assigned_doctor_name`,
    `assigned_doctor_id`,
    `appointment_dateTime`,
    `notes`,
    `cancel_reason`,
    `treatment_provided`,
    `appointment_created_by`,
    `appointment_created_by_emp_id`,
    `appointment_updated_by`,
    `appointment_updated_by_emp_id`,
    `appointment_status`,
    `opd_amount`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_Status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    120,
    'DH_41',
    'Madan Mahal',
    NULL,
    'shadab',
    'dg_4',
    '2024-05-11T16:00',
    'dfdfg',
    NULL,
    'OPD',
    'shadab',
    'dg_4',
    'shadab',
    'dg_4',
    'Complete',
    '500',
    'cash',
    '',
    'paid',
    '2024-05-11 15:39:00',
    '2024-05-11 15:40:24'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: branches
# ------------------------------------------------------------

INSERT INTO
  `branches` (
    `branch_id`,
    `branch_name`,
    `branch_email`,
    `hospital_name`,
    `hospital_id`,
    `branch_address`,
    `branch_contact`,
    `open_time`,
    `close_time`,
    `appoint_slot_duration`,
    `week_off`,
    `head_img`,
    `foot_img`
  )
VALUES
  (
    1,
    'Madan Mahal',
    'madanmahal@gmail.com',
    'dental square',
    'hos_1',
    'Madan Mahal',
    '8602161019',
    '09:00:00.000000',
    '12:00:00.000000',
    '10 min',
    'sunday',
    'https://dentalgurusuperadmin.doaguru.com/branchHeadFootImg/1715247720219bull-5056041_1280.png',
    'https://dentalgurusuperadmin.doaguru.com/branchHeadFootImg/1715247720225Untitled design.png'
  );
INSERT INTO
  `branches` (
    `branch_id`,
    `branch_name`,
    `branch_email`,
    `hospital_name`,
    `hospital_id`,
    `branch_address`,
    `branch_contact`,
    `open_time`,
    `close_time`,
    `appoint_slot_duration`,
    `week_off`,
    `head_img`,
    `foot_img`
  )
VALUES
  (
    2,
    'Vijay Nagar',
    NULL,
    'dental square',
    'hos_1',
    'Vijay Nagar',
    '8602161018',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: clinic_prescription
# ------------------------------------------------------------

INSERT INTO
  `clinic_prescription` (
    `pr_id`,
    `branch_name`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `notes`
  )
VALUES
  (
    3,
    'Madan Mahal',
    'Paracetamol 425 tablet',
    '10',
    '1-1-1',
    '1',
    'test afgain'
  );
INSERT INTO
  `clinic_prescription` (
    `pr_id`,
    `branch_name`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `notes`
  )
VALUES
  (
    4,
    'Madan Mahal',
    'Disprin 325 tablet',
    '10',
    '1-1-1',
    '1',
    'take with poison'
  );
INSERT INTO
  `clinic_prescription` (
    `pr_id`,
    `branch_name`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `notes`
  )
VALUES
  (
    6,
    'Madan Mahal',
    'PCM',
    '6',
    '1-1',
    '2 days',
    'with warm water'
  );
INSERT INTO
  `clinic_prescription` (
    `pr_id`,
    `branch_name`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `notes`
  )
VALUES
  (
    8,
    'Madan Mahal',
    'test',
    'test',
    'test',
    'test',
    'test'
  );
INSERT INTO
  `clinic_prescription` (
    `pr_id`,
    `branch_name`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `notes`
  )
VALUES
  (
    9,
    NULL,
    'Paracetamol 325 tablet',
    '10',
    '1-1-1',
    '2 min',
    'test'
  );
INSERT INTO
  `clinic_prescription` (
    `pr_id`,
    `branch_name`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `notes`
  )
VALUES
  (
    10,
    NULL,
    'Paracetamol 325 tabledsfdf',
    '103',
    'test3',
    '2 min3',
    'test afgain3'
  );
INSERT INTO
  `clinic_prescription` (
    `pr_id`,
    `branch_name`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `notes`
  )
VALUES
  (11, NULL, 'cold', '34', '34', '3333', '4');
INSERT INTO
  `clinic_prescription` (
    `pr_id`,
    `branch_name`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `notes`
  )
VALUES
  (12, NULL, 'cold23', '34', '34', '3333', '4');
INSERT INTO
  `clinic_prescription` (
    `pr_id`,
    `branch_name`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `notes`
  )
VALUES
  (13, NULL, 'Paracetamol 9399w3w3', '23', '3', '3', '3');
INSERT INTO
  `clinic_prescription` (
    `pr_id`,
    `branch_name`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `notes`
  )
VALUES
  (14, 'Madan Mahal', 'ddww', '223', '233', '2332', 'we3');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: dental_examination
# ------------------------------------------------------------

INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    3,
    16,
    'Madan Mahal',
    12,
    '123456',
    '54, 53, 52',
    'Fracture',
    'lala',
    'lala',
    'lala',
    'Pediatric',
    '2024-04-14 18:48:56'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    12,
    16,
    'Madan Mahal',
    1,
    '123456',
    '55, 54, 53, 52',
    'Caries',
    'tata',
    'taat',
    'tata',
    'Pediatric',
    '2024-04-14 18:48:44'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    13,
    NULL,
    'Madan Mahal',
    1,
    NULL,
    '55',
    'Fracture',
    'tooth issue',
    'take care',
    'teeth clean',
    NULL,
    '2024-04-14 18:48:59'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    14,
    16,
    'Madan Mahal',
    1,
    '123456',
    '81, 71, 72',
    'Impacted',
    'tata',
    'tata',
    'tata',
    'Pediatric',
    '2024-04-14 18:49:06'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    15,
    18,
    'Madan Mahal',
    12,
    '123456',
    '85',
    'Caries',
    'ssdsd',
    'advice frontend',
    'asf',
    'Pediatric',
    '2024-04-14 18:48:50'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    16,
    24,
    'Madan Mahal',
    26,
    '123456',
    '55',
    'Fracture',
    'chief',
    'advice',
    'examination',
    'Pediatric',
    '2024-04-14 18:49:02'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    17,
    24,
    'Madan Mahal',
    26,
    '123456',
    '54, 53',
    'Caries',
    'test caries',
    'test caries',
    'test caries',
    'Pediatric',
    '2024-04-14 18:48:53'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    18,
    29,
    NULL,
    11,
    '123456',
    '63',
    'Missing Tooth',
    'zdfad',
    'adgfas',
    'sdagsdag',
    'Pediatric',
    '2024-04-18 12:45:33'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    19,
    29,
    NULL,
    11,
    NULL,
    '62',
    'Mobility',
    'sdgsd',
    'adfgsdfg',
    'sdgsd',
    NULL,
    '2024-04-18 12:45:50'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    20,
    30,
    'Madan Mahal',
    11,
    '123456',
    '55, 54',
    'Caries',
    'lala',
    'lala',
    'lala',
    'Pediatric',
    '2024-04-19 13:37:58'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    21,
    30,
    'Madan Mahal',
    11,
    NULL,
    '53, 52',
    'Fracture',
    'lala',
    'lala',
    'lala',
    NULL,
    '2024-04-19 13:38:03'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    22,
    30,
    'Madan Mahal',
    11,
    '123456',
    '85, 84',
    'Impacted',
    'test',
    'test',
    'test',
    'Pediatric',
    '2024-04-19 13:38:06'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    23,
    30,
    'Madan Mahal',
    11,
    '123456',
    '82, 81',
    'Root Stump',
    'test',
    'test',
    'test',
    'Pediatric',
    '2024-04-19 13:36:28'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    24,
    33,
    'Madan Mahal',
    2,
    '789012',
    '18, 17',
    'Caries',
    'test',
    'test',
    'test',
    'Dental-X',
    '2024-04-20 19:57:45'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    25,
    33,
    'Madan Mahal',
    2,
    NULL,
    '18, 17',
    'Fracture',
    'ftest',
    'test',
    'test',
    NULL,
    '2024-04-20 19:57:59'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    26,
    35,
    'Madan Mahal',
    26,
    '123456',
    '18, 17',
    'Mobility',
    'test',
    'test',
    'test',
    'Dental-X',
    '2024-04-21 17:19:04'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    27,
    37,
    'Madan Mahal',
    12,
    '123456',
    '55, 54',
    'Mobility',
    'test',
    'test',
    'test',
    'Pediatric',
    '2024-04-21 19:40:59'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    28,
    39,
    'Madan Mahal',
    32,
    '123456',
    '55, 54',
    'Caries',
    'test-11',
    'test-11',
    'test-11',
    'Pediatric',
    '2024-04-24 12:42:52'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    32,
    39,
    'Madan Mahal',
    32,
    '123456',
    '83, 82',
    'Fracture',
    'test-12',
    'test-12',
    'test-12',
    'Pediatric',
    '2024-04-24 12:50:03'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    34,
    42,
    'Madan Mahal',
    23,
    '123456',
    '18',
    'Caries',
    'pain',
    'not take hot water',
    'yes',
    'Dental-X',
    '2024-04-24 17:37:22'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    35,
    43,
    'Madan Mahal',
    50,
    NULL,
    '55',
    'Caries',
    'test',
    'test',
    'test',
    'Pediatric',
    '2024-04-24 18:53:06'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    36,
    45,
    'Madan Mahal',
    54,
    NULL,
    '54',
    'Caries',
    'test',
    'test',
    'test',
    'Pediatric',
    '2024-04-24 20:02:32'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    37,
    46,
    'Madan Mahal',
    30,
    '123456',
    '55',
    'Caries',
    'test-14',
    'test-14',
    'test-14',
    'Pediatric',
    '2024-04-24 20:53:54'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    38,
    48,
    'Madan Mahal',
    56,
    'DH_24',
    '55',
    'Caries',
    'fhjfg',
    'fghfdgh',
    'dgh',
    'Pediatric',
    '2024-04-25 14:17:40'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    40,
    53,
    'Madan Mahal',
    47,
    'DH_24',
    '18',
    'Caries',
    'no',
    'no',
    'yes',
    'Dental-X',
    '2024-04-25 14:29:24'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    41,
    53,
    'Madan Mahal',
    47,
    NULL,
    '17',
    'Fracture',
    'no',
    'no',
    'yes',
    NULL,
    '2024-04-25 14:29:41'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    42,
    57,
    'Madan Mahal',
    59,
    'DH_20',
    '55',
    'Caries',
    'no',
    'no',
    'yes',
    'Pediatric',
    '2024-04-25 14:55:39'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    44,
    65,
    'Madan Mahal',
    61,
    'DH_20',
    '18, 17, 16',
    'Impacted',
    'Impacted by suger',
    'do not take suger',
    'Impacted by suger',
    'Dental-X',
    '2024-04-25 15:55:51'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    46,
    65,
    'Madan Mahal',
    61,
    'DH_20',
    '15, 14, 13',
    'Missing Tooth',
    'ASDFASF',
    'asda',
    'AFASF',
    'Dental-X',
    '2024-04-25 16:03:11'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    47,
    65,
    'Madan Mahal',
    61,
    NULL,
    '42, 41, 31',
    'Root Stump',
    'sgsa',
    'gseg',
    'wsrtgwrg',
    NULL,
    '2024-04-25 16:03:58'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    48,
    67,
    'Madan Mahal',
    62,
    'DH_26',
    '55, 82, 84, 51',
    'Supra Erupted',
    'Supra Erupted',
    'Supra Erupted',
    'Supra Erupted',
    'Pediatric',
    '2024-04-25 18:27:10'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    49,
    67,
    'Madan Mahal',
    62,
    NULL,
    '54',
    'Periapical Abscess',
    'Periapical Abscess',
    'Periapical Abscess',
    'Periapical Abscess',
    'Pediatric',
    '2024-04-25 18:28:21'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    50,
    68,
    'Madan Mahal',
    36,
    '123456',
    '18',
    'Caries',
    '',
    '',
    '',
    'Dental-X',
    '2024-04-26 10:45:58'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    51,
    70,
    'Madan Mahal',
    36,
    '123456',
    '18, 17',
    'Periapical Abscess',
    'test',
    'test',
    'terst',
    'Dental-X',
    '2024-04-26 11:54:15'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    53,
    71,
    'Madan Mahal',
    64,
    NULL,
    '18',
    'Caries',
    'no',
    'no',
    'yes',
    NULL,
    '2024-04-26 14:07:29'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    54,
    74,
    'Madan Mahal',
    48,
    'DH_24',
    '18',
    'Caries',
    'test',
    'test',
    'test',
    'Dental-X',
    '2024-04-27 13:26:33'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    55,
    75,
    'Madan Mahal',
    65,
    'DH_12',
    '18, 17',
    'Fracture',
    'test',
    'test',
    'test',
    'Dental-X',
    '2024-04-27 15:49:17'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    56,
    79,
    'Madan Mahal',
    71,
    'DH_27',
    '18, 48',
    'Mobility',
    'Mobility',
    'Mobility',
    'Mobility',
    'Dental-X',
    '2024-04-27 18:40:25'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    58,
    79,
    'Madan Mahal',
    71,
    NULL,
    '',
    'Supra Erupted',
    'Supra Erupted',
    'Supra Erupted',
    'Supra Erupted',
    NULL,
    '2024-04-27 18:42:00'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    59,
    79,
    'Madan Mahal',
    71,
    NULL,
    '',
    '',
    '',
    '',
    '',
    NULL,
    '2024-04-27 18:42:26'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    60,
    82,
    'Madan Mahal',
    75,
    'DH_30',
    '18, 17',
    'Impacted',
    'Impacted umer first',
    'Impacted umer first',
    'Impacted umer first',
    'Dental-X',
    '2024-04-27 19:38:52'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    61,
    82,
    'Madan Mahal',
    75,
    NULL,
    '14, 13',
    'Fracture',
    'Fracture umer first',
    'Fracture umer first',
    'Fracture umer first',
    NULL,
    '2024-04-27 19:39:33'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    62,
    83,
    'Madan Mahal',
    76,
    'DH_31',
    '84',
    'Impacted',
    'Impacted umer second',
    'Impacted umer second',
    'Impacted umer second',
    'Pediatric',
    '2024-04-27 20:26:10'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    63,
    83,
    'Madan Mahal',
    76,
    'DH_31',
    '83, 82',
    'Fracture',
    'Fracture umer second',
    'Fracture umer second',
    'Fracture umer second',
    'Pediatric',
    '2024-04-27 20:29:33'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    64,
    85,
    'Madan Mahal',
    79,
    'DH_33',
    '55',
    'Caries',
    'test',
    'test',
    '`test',
    'Pediatric',
    '2024-04-29 16:27:18'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    65,
    85,
    'Madan Mahal',
    79,
    NULL,
    '54, 55',
    'Fracture',
    'test ',
    'test',
    'test',
    'Pediatric',
    '2024-04-29 16:27:56'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    66,
    86,
    'Madan Mahal',
    79,
    'DH_33',
    '18',
    'Impacted',
    'test',
    'test',
    'trest',
    'Dental-X',
    '2024-04-29 16:28:38'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    67,
    86,
    'Madan Mahal',
    79,
    NULL,
    '17, 18',
    'Missing Tooth',
    'test',
    't43est',
    'test',
    NULL,
    '2024-04-29 16:29:02'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    68,
    86,
    'Madan Mahal',
    79,
    'DH_33',
    '16, 15',
    'Mobility',
    'test',
    'teasrt',
    'terst',
    'Dental-X',
    '2024-04-29 16:35:14'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    70,
    89,
    'Madan Mahal',
    81,
    'DH_35',
    '18',
    'Caries',
    'no',
    'no',
    'yes',
    'Dental-X',
    '2024-05-03 12:33:03'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    71,
    90,
    'Madan Mahal',
    86,
    'DH_36',
    '17, 47',
    'Root Stump',
    'chief frontend Root Stump',
    'advice Root Stump',
    'exam Root Stump',
    'Dental-X',
    '2024-05-06 12:32:25'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    72,
    90,
    'Madan Mahal',
    86,
    'DH_36',
    '27, 37',
    'Fracture',
    'chief frontend Fracture',
    'advice Fracture',
    'exam Fracture',
    'Dental-X',
    '2024-05-06 12:33:21'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    73,
    91,
    'Madan Mahal',
    85,
    'DH_28',
    '83',
    'Impacted',
    'test',
    'advice frontend 3-1',
    'asf',
    'Pediatric',
    '2024-05-06 16:41:39'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    74,
    92,
    'Madan Mahal',
    89,
    'DH_26',
    '84',
    'Impacted',
    'ssdsd',
    'advice frontend 3-1',
    'asf',
    'Pediatric',
    '2024-05-07 11:15:09'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    75,
    93,
    'Madan Mahal',
    90,
    'DH_29',
    '52, 51',
    'Missing Tooth',
    'chief Missing Tooth',
    'advice Missing Tooth',
    'exam Missing Tooth',
    'Pediatric',
    '2024-05-07 14:17:01'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    76,
    94,
    'Madan Mahal',
    93,
    'DH_19',
    '55, 54',
    'Caries',
    'test',
    'test',
    'tets',
    'Pediatric',
    '2024-05-08 12:28:32'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    77,
    94,
    'Madan Mahal',
    93,
    'DH_19',
    '53, 52',
    'Fracture',
    'test',
    'terstet',
    'TEST',
    'Pediatric',
    '2024-05-08 12:28:50'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    78,
    95,
    'Madan Mahal',
    96,
    '2',
    '83',
    'Fracture',
    'sdgvs',
    'dsagfsda',
    'sdgvdgvbn',
    'Pediatric',
    '2024-05-08 16:47:51'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    79,
    96,
    'Madan Mahal',
    97,
    'DH_25',
    '55, 54',
    'Caries',
    'test',
    'test',
    'tewst',
    'Pediatric',
    '2024-05-08 17:34:49'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    80,
    97,
    'Madan Mahal',
    108,
    'DH_15',
    '83',
    'Impacted',
    'cc Impacted',
    'adv Impacted',
    'exm Impacted',
    'Pediatric',
    '2024-05-10 15:47:25'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    81,
    98,
    'Madan Mahal',
    108,
    'DH_15',
    '84',
    'Fracture',
    'cc Impacted',
    'advice frontend',
    'exam frontend',
    'Pediatric',
    '2024-05-10 15:50:51'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    82,
    99,
    'Madan Mahal',
    108,
    'DH_15',
    '82',
    'Missing Tooth',
    'chief frontend ',
    'new data redux ADVICE',
    'new data redux exam',
    'Pediatric',
    '2024-05-10 15:59:56'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    86,
    100,
    'Madan Mahal',
    115,
    'DH_38',
    '16, 15',
    'Fracture',
    'fbshg',
    'ghmjg',
    'gnf',
    'Dental-X',
    '2024-05-11 12:42:36'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    87,
    100,
    'Madan Mahal',
    115,
    'DH_38',
    '18',
    'Missing Tooth',
    'vbdgh',
    ',kjh',
    'nhg',
    'Dental-X',
    '2024-05-11 12:43:00'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    88,
    101,
    'Madan Mahal',
    115,
    'DH_38',
    '16, 15',
    'Caries',
    'wdcw',
    'DQWD',
    'cddd',
    'Dental-X',
    '2024-05-11 12:48:33'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    89,
    102,
    'Madan Mahal',
    116,
    'DH_39',
    '17, 16',
    'Caries',
    'ECwe',
    'cc',
    'DDSDC',
    'Dental-X',
    '2024-05-11 12:57:15'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    90,
    102,
    'Madan Mahal',
    116,
    'DH_39',
    '15, 46, 45',
    'Missing Tooth',
    'wdcw',
    'FFF',
    'cddd',
    'Dental-X',
    '2024-05-11 12:57:41'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    91,
    103,
    'Madan Mahal',
    120,
    'DH_41',
    '54, 53',
    'Caries',
    'sFEWFD',
    'FFF',
    'fEWF',
    'Pediatric',
    '2024-05-11 15:41:42'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    92,
    103,
    'Madan Mahal',
    120,
    'DH_41',
    '52, 51',
    'Impacted',
    'sFEWFD',
    'FFF',
    'fEWF',
    'Pediatric',
    '2024-05-11 15:41:59'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    93,
    107,
    'Madan Mahal',
    119,
    'DH_40',
    '15, 16',
    'Caries',
    '1dqw',
    'qwdq',
    'qew',
    'Dental-X',
    '2024-05-11 19:16:50'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    94,
    108,
    'Madan Mahal',
    122,
    'DH_42',
    '17',
    'Mobility',
    'XXX',
    'FFF',
    'fEWF',
    'Dental-X',
    '2024-05-11 19:31:38'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    95,
    109,
    'Madan Mahal',
    123,
    'DH_37',
    '14',
    'Periapical Abscess',
    'ECwe',
    'FFF',
    'fEWF',
    'Dental-X',
    '2024-05-11 19:51:41'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    96,
    110,
    'Madan Mahal',
    114,
    'DH_14',
    '18, 48',
    'Caries',
    'Issues are there',
    'Get treatment ',
    'Xray needed',
    'Dental-X',
    '2024-05-11 21:25:54'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    97,
    111,
    'Madan Mahal',
    123,
    'DH_37',
    '55',
    'Caries',
    'test',
    'test',
    'test',
    'Pediatric',
    '2024-05-13 14:47:20'
  );
INSERT INTO
  `dental_examination` (
    `exm_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `patient_uhid`,
    `selected_teeth`,
    `disease`,
    `chief_complain`,
    `advice`,
    `on_examination`,
    `diagnosis_category`,
    `date`
  )
VALUES
  (
    98,
    112,
    'Madan Mahal',
    123,
    'DH_37',
    '85',
    'Fracture',
    'test',
    'test',
    'test',
    'Pediatric',
    '2024-05-13 15:56:23'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: dental_prescription
# ------------------------------------------------------------

INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    1,
    12,
    18,
    'Madan Mahal',
    '123456',
    'Caries',
    'Dental Cleanings',
    NULL,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    'test',
    '2024-04-10 21:51:43'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    2,
    12,
    18,
    'Madan Mahal',
    '123456',
    'Caries',
    'Fluoride Treatments',
    NULL,
    'Disprin 350 tablet',
    '100mg',
    '1-1-1(TDS)',
    '1 day',
    'test-2',
    '2024-04-10 21:58:51'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    4,
    12,
    18,
    'Madan Mahal',
    '123456',
    'Caries',
    'Dental Cleanings',
    NULL,
    'Disprin 325 tablet',
    '1000mg',
    '1-1-1(TDS)',
    '1 day',
    'take after sleep',
    '2024-04-12 18:35:30'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    5,
    26,
    24,
    'Madan Mahal',
    '123456',
    'Fracture',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Aspirin',
    '500mg',
    'Once daily',
    '7 days',
    'Take with food',
    '2024-04-13 13:23:54'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    6,
    26,
    24,
    'Madan Mahal',
    '123456',
    'Fracture',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-13 13:24:18'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    7,
    26,
    24,
    'Madan Mahal',
    '123456',
    'Caries',
    'Root Canal Treatment @ per tooth',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-0(BD)',
    '1 day',
    '',
    '2024-04-14 19:00:46'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    8,
    26,
    24,
    'Madan Mahal',
    '123456',
    'Caries',
    'Root Canal Treatment @ per tooth',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-13 19:35:04'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    9,
    0,
    29,
    'Madan Mahal',
    '123456',
    '',
    'Digital Compuler zcd XRay (R.V.G.)',
    3,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '2 days',
    'sdfasd',
    '2024-04-18 14:33:22'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    10,
    0,
    30,
    'Madan Mahal',
    '123456',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-19 14:20:06'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    11,
    0,
    30,
    'Madan Mahal',
    '123456',
    'Fracture',
    'Root Canal Treatment @ per tooth',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-19 15:03:56'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    12,
    0,
    33,
    'Madan Mahal',
    '789012',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    2,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-20 21:13:07'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    13,
    0,
    35,
    'Madan Mahal',
    '123456',
    'Mobility',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-21 17:27:39'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    14,
    0,
    37,
    'Madan Mahal',
    '123456',
    'Mobility',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-22 12:58:51'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    15,
    0,
    39,
    'Madan Mahal',
    '123456',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-24 13:42:05'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    18,
    0,
    39,
    'Madan Mahal',
    '123456',
    'Fracture',
    'Re-Root Canal Treatlment @ per tooth',
    1,
    'Disprin 325 tablet',
    '6',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-24 16:35:14'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    19,
    0,
    42,
    'Madan Mahal',
    '123456',
    'Caries',
    'Biopsy',
    1,
    'Disprin 325 tablet',
    '1',
    '0-0-1(HS)',
    '1 day',
    '',
    '2024-04-24 17:41:21'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    20,
    0,
    43,
    'Madan Mahal',
    'DH_21',
    'Caries',
    'Root Canal Treatment @ per tooth',
    1,
    'Disprin 325 tablet',
    '1',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-24 19:02:11'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    21,
    0,
    45,
    'Madan Mahal',
    'DH_23',
    'Caries',
    'Re-Root Canal Treatlment @ per tooth',
    1,
    'Disprin 350 tablet',
    '1',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-24 20:11:42'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    22,
    0,
    53,
    'Madan Mahal',
    'DH_20',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '1',
    'SOS',
    '1 day',
    '',
    '2024-04-25 14:37:24'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    23,
    0,
    57,
    'Madan Mahal',
    'DH_20',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '1',
    'SOS',
    '1 day',
    '',
    '2024-04-25 14:59:09'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    24,
    0,
    63,
    'Madan Mahal',
    'DH_20',
    'Missing Tooth',
    'Single Implant',
    1,
    'Disprin 325 tablet',
    '',
    'SOS',
    '1 day',
    '',
    '2024-04-25 15:24:07'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    26,
    0,
    63,
    'Madan Mahal',
    'DH_20',
    'Missing Tooth',
    'Single Implant',
    1,
    '',
    '',
    '',
    '',
    '',
    '2024-04-25 15:24:24'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    28,
    0,
    65,
    'Madan Mahal',
    'DH_12',
    'Impacted',
    'Pulpectomy (Child) @ per tooth',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-0(BD)',
    '2 days',
    'asfas',
    '2024-04-25 16:32:06'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    29,
    0,
    65,
    'Madan Mahal',
    'DH_12',
    'Impacted',
    'Pulpectomy (Child) @ per tooth',
    1,
    'Disprin 325 tablet',
    '100mg',
    '1-1-0(BD)',
    '2 days',
    'asfdqaf',
    '2024-04-25 16:32:20'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    30,
    0,
    67,
    'Madan Mahal',
    'DH_26',
    'Periapical Abscess',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '2 days',
    'xvbdx',
    '2024-04-25 18:59:50'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    32,
    0,
    71,
    'Madan Mahal',
    'DH_27',
    'Caries',
    'Root Canal Treatment @ per tooth',
    1,
    'Disprin 325 tablet',
    '6',
    '1-1-1(TDS)',
    '2 days',
    '',
    '2024-04-26 14:11:59'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    33,
    0,
    70,
    'Madan Mahal',
    '123456',
    'Periapical Abscess',
    'Root Canal Treatment @ per tooth',
    2,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-26 15:58:07'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    34,
    0,
    74,
    'Madan Mahal',
    '123456',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-27 13:28:10'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    35,
    0,
    75,
    'Madan Mahal',
    'DH_27',
    'Fracture',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-27 15:51:51'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    36,
    0,
    82,
    'Madan Mahal',
    'DH_30',
    'Fracture',
    'Root Canal Treatment @ per tooth',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-0(BD)',
    '1 day',
    'umer first',
    '2024-04-27 19:59:36'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    37,
    0,
    83,
    'Madan Mahal',
    'DH_31',
    'Impacted',
    'Root Canal Treatment @ per tooth',
    1,
    'Disprin 350 tablet',
    '300mg',
    '1-1-0(BD)',
    '2 days',
    'sge',
    '2024-04-27 20:31:52'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    40,
    0,
    86,
    'Madan Mahal',
    'DH_33',
    'Impacted',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'test',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-04-30 12:13:19'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    41,
    0,
    86,
    'Madan Mahal',
    'DH_33',
    'Impacted',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '2 days',
    '',
    '2024-04-30 12:13:31'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    42,
    0,
    89,
    'Madan Mahal',
    'DH_35',
    'Caries',
    'Root Canal Treatment @ per tooth',
    1,
    'Disprin 325 tablet',
    '1',
    'SOS',
    '1 day',
    '',
    '2024-05-03 12:36:29'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    43,
    0,
    89,
    'Madan Mahal',
    'DH_35',
    'Caries',
    'Root Canal Treatment @ per tooth',
    2,
    'Disprin 325 tablet',
    '1',
    'SOS',
    '1 day',
    '',
    '2024-05-03 12:47:45'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    44,
    0,
    89,
    'Madan Mahal',
    'DH_35',
    'Caries',
    'Root Canal Treatment @ per tooth',
    2,
    'Disprin 500 tablet',
    '1',
    'SOS',
    '1 day',
    '',
    '2024-05-03 12:56:40'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    45,
    0,
    90,
    'Madan Mahal',
    'DH_36',
    'Fracture',
    'Ceramic Braces',
    1,
    'Disprin 500 tablet',
    '300mg',
    '1-1-0(BD)',
    '2 days',
    'sfghdsfh',
    '2024-05-06 12:50:16'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    46,
    0,
    95,
    'Madan Mahal',
    '2',
    'Fracture',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '100mg',
    '1-1-0(BD)',
    '1 day',
    'test for single sitting ',
    '2024-05-08 17:05:51'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    47,
    0,
    94,
    'Madan Mahal',
    'DH_19',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-05-09 11:18:26'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    48,
    0,
    98,
    'Madan Mahal',
    'DH_15',
    'Fracture',
    'Indirect Pulp Capping @ per tooth',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-0(BD)',
    '2 days',
    '',
    '2024-05-10 15:51:51'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    50,
    0,
    101,
    'Madan Mahal',
    'DH_38',
    'Caries',
    'Root Canal Treatment @ per tooth',
    1,
    'Disprin 325 tablet',
    'CCC',
    '1-1-0(BD)',
    '1 day',
    'ewd',
    '2024-05-11 12:54:09'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    53,
    0,
    102,
    'Madan Mahal',
    'DH_39',
    'Caries',
    'Ceramic Braces',
    1,
    'Disprin 400 tablet',
    '3',
    '1-1-1(TDS)',
    '2 days',
    'EWDEW',
    '2024-05-11 13:04:14'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    54,
    0,
    103,
    'Madan Mahal',
    'DH_41',
    'Caries',
    'Metal Braces',
    1,
    'Disprin 400 tablet',
    'd',
    '1-1-1(TDS)',
    '3 weeks',
    'aesd',
    '2024-05-11 15:46:53'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    55,
    0,
    103,
    'Madan Mahal',
    'DH_41',
    'Caries',
    'Metal Braces',
    1,
    'Disprin 325 tablet',
    'nbg',
    '1-1-1(TDS)',
    '1 day',
    ' b',
    '2024-05-11 15:54:09'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    56,
    0,
    103,
    'Madan Mahal',
    'DH_41',
    'Caries',
    'Metal Braces',
    2,
    'Disprin 325 tablet',
    'd',
    '1-1-0(BD)',
    '2 days',
    'gui',
    '2024-05-11 15:55:54'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    57,
    0,
    111,
    'Madan Mahal',
    'DH_37',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '200mg',
    '0-1-0(OD)',
    '2 weeks',
    '',
    '2024-05-13 14:50:15'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    58,
    123,
    111,
    'Madan Mahal',
    'DH_37',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-1(TDS)',
    '1 day',
    '',
    '2024-05-13 15:08:04'
  );
INSERT INTO
  `dental_prescription` (
    `id`,
    `appoint_id`,
    `tp_id`,
    `branch_name`,
    `patient_uhid`,
    `desease`,
    `treatment`,
    `sitting_number`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `date`
  )
VALUES
  (
    59,
    123,
    111,
    'Madan Mahal',
    'DH_37',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    1,
    'Disprin 325 tablet',
    '300mg',
    '1-1-0(BD)',
    '1 day',
    '',
    '2024-05-13 15:08:31'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: dental_treatment
# ------------------------------------------------------------

INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    1,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'faltu admi',
    '2024-04-10 19:22:46'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    2,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'test',
    '2024-04-10 19:22:54'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    3,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'test2',
    '2024-04-10 19:22:58'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    4,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'test for complete',
    '2024-04-10 19:23:02'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    5,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'test for complete 2',
    '2024-04-10 19:23:05'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    6,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'test for complete 3',
    '2024-04-10 19:23:07'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    7,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'dgdgb',
    '2024-04-10 19:23:10'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    8,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'dfgdgf',
    '2024-04-10 19:23:13'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    9,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'xcvbsdgh',
    '2024-04-10 19:23:17'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    10,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'yesssssssss',
    '2024-04-10 19:23:20'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    11,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'dfhsnbn',
    '2024-04-10 19:23:22'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    13,
    11,
    18,
    'Madan Mahal',
    12,
    NULL,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'treat',
    '2024-04-10 19:23:25'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    14,
    11,
    18,
    'Madan Mahal',
    12,
    1,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'with sitting number',
    '2024-04-10 19:43:50'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    15,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 16:35:23'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    16,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 16:44:01'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    17,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 16:58:17'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    18,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:05:13'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    19,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:06:46'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    20,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:08:35'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    21,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:13:29'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    22,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:13:32'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    23,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:13:32'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    24,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:13:32'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    25,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:13:33'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    26,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:14:08'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    27,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:14:17'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    28,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:14:18'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    29,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 17:14:20'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    30,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '10',
    '2500',
    2250,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 18:51:35'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    31,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 18:52:01'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    32,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 18:52:35'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    33,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 18:53:33'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    34,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 18:59:17'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    35,
    12,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Fluoride Treatments',
    '85',
    '1',
    '2500',
    '',
    '',
    '2500',
    2500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 19:04:06'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    36,
    11,
    18,
    'Madan Mahal',
    12,
    2,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 19:06:01'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    37,
    11,
    18,
    'Madan Mahal',
    12,
    3,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '',
    '1000',
    1000,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 19:07:01'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    38,
    11,
    18,
    'Madan Mahal',
    12,
    3,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '',
    '1000',
    1000,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 19:11:00'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    39,
    11,
    18,
    'Madan Mahal',
    12,
    3,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '',
    '1000',
    1000,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 19:11:49'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    40,
    11,
    18,
    'Madan Mahal',
    12,
    3,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '',
    '1000',
    1000,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 19:12:05'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    41,
    11,
    18,
    'Madan Mahal',
    12,
    3,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '',
    '1000',
    1000,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 19:13:10'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    42,
    11,
    18,
    'Madan Mahal',
    12,
    3,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 19:14:40'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    43,
    11,
    18,
    'Madan Mahal',
    12,
    3,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 19:14:57'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    44,
    11,
    18,
    'Madan Mahal',
    12,
    3,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '20',
    '1000',
    800,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 19:19:23'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    45,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 20:06:22'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    46,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '',
    '1000',
    1000,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 20:07:04'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    47,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 20:46:43'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    48,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 20:47:05'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    49,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 20:54:55'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    50,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '2024-04-11 21:04:45'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    51,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Pending',
    '',
    '2024-04-12 17:06:57'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    52,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '',
    '2024-04-12 17:29:09'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    53,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '',
    '2024-04-12 17:51:09'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    54,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Received',
    '',
    '2024-04-26 12:44:05'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    55,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '10',
    '1000',
    900,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    '',
    '2024-04-12 18:31:05'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    56,
    11,
    18,
    'Madan Mahal',
    12,
    4,
    '123456',
    'Dental Cleanings',
    '85',
    '1',
    '1000',
    '',
    '0',
    '1000',
    1000,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Pending',
    '',
    '2024-04-12 19:27:47'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    58,
    14,
    24,
    'Madan Mahal',
    20,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '10',
    '300',
    270,
    NULL,
    NULL,
    0,
    NULL,
    'dg_4',
    '',
    '',
    '2024-04-15 19:56:13'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    59,
    16,
    24,
    'Madan Mahal',
    26,
    1,
    '123456',
    'Root Canal Treatment @ per tooth',
    '54, 53',
    '2',
    '3000',
    '',
    '50',
    '6000',
    3000,
    NULL,
    NULL,
    3000,
    NULL,
    'dg_4',
    'Received',
    '',
    '2024-04-26 12:44:13'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    60,
    14,
    24,
    'Madan Mahal',
    25,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '100',
    '300',
    0,
    NULL,
    NULL,
    0,
    NULL,
    'dg_4',
    'Received',
    '',
    '2024-04-26 15:07:18'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    61,
    14,
    24,
    'Madan Mahal',
    21,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '100',
    '300',
    0,
    NULL,
    NULL,
    0,
    NULL,
    'dg_4',
    'Received',
    '',
    '2024-04-26 15:07:22'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    62,
    14,
    24,
    'Madan Mahal',
    0,
    2,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '100',
    '300',
    0,
    NULL,
    NULL,
    0,
    NULL,
    'dg_4',
    'Received',
    '',
    '2024-04-26 15:15:23'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    63,
    18,
    29,
    'Madan Mahal',
    0,
    NULL,
    '123456',
    'Removable Partial Dentures @ per tooth',
    '62',
    '1',
    '800',
    '',
    '2',
    '800',
    784,
    NULL,
    NULL,
    0,
    NULL,
    'dg_4',
    'Recieved',
    'sdgsda',
    '2024-04-18 14:44:25'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    64,
    19,
    30,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    0,
    5400,
    'dg_4',
    'Received',
    '',
    '2024-04-19 19:43:16'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    65,
    19,
    30,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    540,
    5400,
    'dg_4',
    'Received',
    '',
    '2024-04-19 19:43:16'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    66,
    19,
    30,
    'Madan Mahal',
    0,
    2,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    540,
    5400,
    'dg_4',
    'Received',
    '',
    '2024-04-19 19:43:16'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    67,
    20,
    30,
    'Madan Mahal',
    0,
    NULL,
    '123456',
    'Root Canal Treatment @ per tooth',
    '53, 52',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    1400,
    5400,
    'dg_4',
    'Received',
    '',
    '2024-04-19 19:43:16'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    68,
    20,
    30,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Root Canal Treatment @ per tooth',
    '53, 52',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    1400,
    5400,
    'dg_4',
    'Received',
    '',
    '2024-04-19 19:43:16'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    69,
    20,
    30,
    'Madan Mahal',
    0,
    2,
    '123456',
    'Root Canal Treatment @ per tooth',
    '53, 52',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    1400,
    5400,
    'dg_4',
    'Received',
    '',
    '2024-04-19 19:43:16'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    70,
    20,
    30,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Root Canal Treatment @ per tooth',
    '53, 52',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    1400,
    5400,
    'dg_4',
    'Received',
    '',
    '2024-04-19 19:43:16'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    71,
    20,
    30,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Root Canal Treatment @ per tooth',
    '53, 52',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    1400,
    5400,
    'dg_4',
    'Received',
    '',
    '2024-04-19 19:43:16'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    72,
    20,
    30,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Root Canal Treatment @ per tooth',
    '53, 52',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    5400,
    5400,
    'dg_4',
    'Received',
    '',
    '2024-04-19 19:43:16'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    73,
    20,
    30,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Root Canal Treatment @ per tooth',
    '53, 52',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    0,
    5400,
    'dg_4',
    'Received',
    '',
    '2024-04-19 19:43:16'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    74,
    20,
    30,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Root Canal Treatment @ per tooth',
    '53, 52',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    -600,
    NULL,
    'dg_4',
    'Recieved',
    '',
    '2024-04-19 19:56:18'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    75,
    20,
    30,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Root Canal Treatment @ per tooth',
    '53, 52',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    400,
    5000,
    'dg_4',
    'Received',
    '',
    '2024-04-26 15:15:39'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    76,
    20,
    30,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Root Canal Treatment @ per tooth',
    '53, 52',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    400,
    5000,
    'dg_4',
    'Pending',
    '',
    '2024-04-19 20:12:22'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    77,
    20,
    30,
    'Madan Mahal',
    0,
    2,
    '123456',
    'Root Canal Treatment @ per tooth',
    '53, 52',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    -600,
    5400,
    'dg_4',
    '',
    '',
    '2024-04-19 20:25:40'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    78,
    22,
    33,
    'Madan Mahal',
    0,
    2,
    '789012',
    'Digital Compuler zcd XRay (R.V.G.)',
    '18, 17',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    240,
    300,
    'dg_4',
    'Received',
    '',
    '2024-04-26 15:15:53'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    79,
    22,
    33,
    'Madan Mahal',
    0,
    1,
    '789012',
    'Digital Compuler zcd XRay (R.V.G.)',
    '18, 17',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    540,
    0,
    'dg_4',
    'Received',
    '',
    '2024-04-26 15:15:49'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    80,
    23,
    35,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '18, 17',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    240,
    300,
    'dg_4',
    'Recieved',
    '',
    '2024-04-21 17:26:05'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    81,
    24,
    37,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    540,
    300,
    'dg_4',
    'Pending',
    '',
    '2024-04-22 12:26:47'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    82,
    25,
    39,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    540,
    540,
    'dg_4',
    'Recieved',
    '',
    '2024-04-24 13:52:00'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    83,
    25,
    39,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    540,
    540,
    'dg_4',
    'Recieved',
    '',
    '2024-04-24 13:52:43'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    84,
    25,
    39,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '20',
    '600',
    480,
    NULL,
    NULL,
    480,
    480,
    'dg_4',
    'Recieved',
    '',
    '2024-04-24 13:55:15'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    85,
    25,
    39,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '99',
    '600',
    6,
    NULL,
    NULL,
    6,
    6,
    'dg_4',
    'Recieved',
    '',
    '2024-04-24 14:15:10'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    86,
    25,
    39,
    'Madan Mahal',
    0,
    2,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '98',
    '600',
    12,
    NULL,
    NULL,
    12,
    12,
    'dg_4',
    'Recieved',
    '',
    '2024-04-24 14:17:01'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    87,
    26,
    39,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Re-Root Canal Treatlment @ per tooth',
    '83, 82',
    '2',
    '4000',
    '',
    '10',
    '8000',
    7200,
    NULL,
    NULL,
    5318,
    1882,
    'dg_4',
    'Recieved',
    '',
    '2024-04-24 16:34:30'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    88,
    28,
    42,
    'Madan Mahal',
    0,
    1,
    '123456',
    'Biopsy',
    '18',
    '1',
    '2500',
    '',
    '5',
    '2500',
    2375,
    NULL,
    NULL,
    -125,
    2375,
    'dg_4',
    '',
    '',
    '2024-04-24 17:40:57'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    89,
    29,
    43,
    'Madan Mahal',
    0,
    1,
    'DH_21',
    'Root Canal Treatment @ per tooth',
    '55',
    '1',
    '3000',
    '',
    '10',
    '3000',
    2700,
    NULL,
    NULL,
    1700,
    1000,
    'dg_4',
    'Pending',
    '',
    '2024-04-24 19:01:48'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    90,
    30,
    45,
    'Madan Mahal',
    0,
    1,
    'DH_23',
    'Re-Root Canal Treatlment @ per tooth',
    '54',
    '1',
    '4000',
    '',
    '10',
    '4000',
    3600,
    NULL,
    NULL,
    -400,
    3600,
    'dg_4',
    '',
    '',
    '2024-04-24 20:11:27'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    91,
    32,
    53,
    'Madan Mahal',
    20,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '18',
    '1',
    '300',
    '',
    '5',
    '300',
    285,
    NULL,
    NULL,
    285,
    285,
    'dg_4',
    'Recieved',
    '',
    '2024-04-26 12:38:58'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    92,
    33,
    57,
    'Madan Mahal',
    0,
    1,
    'DH_20',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '5',
    '300',
    285,
    NULL,
    NULL,
    -15,
    285,
    'dg_4',
    'Recieved',
    '',
    '2024-04-25 14:58:56'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    93,
    33,
    57,
    'Madan Mahal',
    0,
    1,
    'DH_20',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '5',
    '300',
    285,
    NULL,
    NULL,
    285,
    15,
    'dg_4',
    'Pending',
    '',
    '2024-04-25 15:00:00'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    94,
    34,
    63,
    'Madan Mahal',
    0,
    1,
    'DH_20',
    'Single Implant',
    '18',
    '1',
    '25000',
    '',
    '5',
    '25000',
    23750,
    NULL,
    NULL,
    23750,
    5000,
    'dg_4',
    'Recieved',
    '',
    '2024-04-25 15:23:34'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    95,
    35,
    65,
    'Madan Mahal',
    0,
    1,
    'DH_12',
    'Pulpectomy (Child) @ per tooth',
    '18, 17, 16',
    '3',
    '2800',
    '',
    '2',
    '8400',
    8232,
    NULL,
    NULL,
    8232,
    7600,
    'dg_4',
    'Recieved',
    'okay ',
    '2024-04-25 16:31:36'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    96,
    39,
    67,
    'Madan Mahal',
    0,
    1,
    'DH_26',
    'Digital Compuler zcd XRay (R.V.G.)',
    '54',
    '1',
    '300',
    '',
    '0',
    '300',
    300,
    NULL,
    NULL,
    -200,
    300,
    'dg_4',
    '',
    'anmsfdkn',
    '2024-04-25 18:59:34'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    97,
    43,
    71,
    'Madan Mahal',
    0,
    1,
    'DH_27',
    'Root Canal Treatment @ per tooth',
    '18',
    '1',
    '3000',
    '',
    '10',
    '3000',
    2700,
    NULL,
    NULL,
    2700,
    2000,
    'dg_4',
    'Recieved',
    '',
    '2024-04-26 14:09:40'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    98,
    42,
    70,
    'Madan Mahal',
    0,
    2,
    '123456',
    'Root Canal Treatment @ per tooth',
    '18, 17',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    2400,
    3000,
    'dg_4',
    'Recieved',
    '',
    '2024-04-26 14:55:22'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    99,
    42,
    70,
    'Madan Mahal',
    0,
    2,
    '123456',
    'Root Canal Treatment @ per tooth',
    '18, 17',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    5400,
    0,
    'dg_4',
    'Pending',
    '',
    '2024-04-26 14:59:30'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    100,
    42,
    70,
    'Madan Mahal',
    36,
    2,
    '123456',
    'Root Canal Treatment @ per tooth',
    '18, 17',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    5400,
    0,
    'dg_4',
    'Pending',
    '',
    '2024-04-26 15:36:13'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    101,
    42,
    70,
    'Madan Mahal',
    36,
    2,
    '123456',
    'Root Canal Treatment @ per tooth',
    '18, 17',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    5400,
    0,
    'dg_4',
    'Pending',
    '',
    '2024-04-26 16:06:43'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    102,
    42,
    70,
    'Madan Mahal',
    36,
    2,
    '123456',
    'Root Canal Treatment @ per tooth',
    '18, 17',
    '2',
    '3000',
    '',
    '50',
    '6000',
    3000,
    NULL,
    NULL,
    3000,
    0,
    'dg_4',
    'Pending',
    '',
    '2024-04-26 16:23:58'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    103,
    42,
    70,
    'Madan Mahal',
    36,
    2,
    '123456',
    'Root Canal Treatment @ per tooth',
    '18, 17',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    5400,
    0,
    'dg_4',
    'Pending',
    '',
    '2024-04-26 16:29:46'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    104,
    44,
    74,
    'Madan Mahal',
    48,
    1,
    '123456',
    'Digital Compuler zcd XRay (R.V.G.)',
    '18',
    '1',
    '300',
    '',
    '10',
    '300',
    270,
    NULL,
    NULL,
    -1730,
    270,
    'dg_4',
    '',
    '',
    '2024-04-27 13:27:55'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    105,
    42,
    70,
    'Madan Mahal',
    67,
    2,
    '123456',
    'Root Canal Treatment @ per tooth',
    '18, 17',
    '2',
    '3000',
    '',
    '10',
    '6000',
    5400,
    NULL,
    NULL,
    5400,
    600,
    'dg_4',
    'Received',
    '',
    '2024-04-27 14:49:28'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    106,
    45,
    75,
    'Madan Mahal',
    65,
    1,
    'DH_27',
    'Digital Compuler zcd XRay (R.V.G.)',
    '18, 17',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    240,
    300,
    'dg_4',
    'Received',
    '',
    '2024-04-27 15:51:35'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    107,
    45,
    75,
    'Madan Mahal',
    65,
    1,
    'DH_27',
    'Digital Compuler zcd XRay (R.V.G.)',
    '18, 17',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    240,
    300,
    'dg_4',
    'Received',
    '',
    '2024-04-27 15:51:35'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    108,
    46,
    79,
    'Madan Mahal',
    71,
    1,
    '',
    'Digital Compuler zcd XRay (R.V.G.)',
    '18, 48',
    '2',
    '300',
    '',
    '0',
    '600',
    600,
    NULL,
    NULL,
    600,
    0,
    'dg_4',
    'Received',
    'okay',
    '2024-04-27 19:06:25'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    109,
    46,
    79,
    'Madan Mahal',
    71,
    1,
    '',
    'Digital Compuler zcd XRay (R.V.G.)',
    '18, 48',
    '2',
    '300',
    '',
    '0',
    '600',
    600,
    NULL,
    NULL,
    600,
    0,
    'dg_4',
    'Received',
    'okay',
    '2024-04-27 19:06:26'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    110,
    49,
    82,
    'Madan Mahal',
    75,
    1,
    'DH_30',
    'Root Canal Treatment @ per tooth',
    '14, 13',
    '2',
    '3000',
    '',
    '0',
    '6000',
    6000,
    NULL,
    NULL,
    2700,
    3300,
    'dg_4',
    '',
    'umer first',
    '2024-04-27 19:55:37'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    111,
    50,
    83,
    'Madan Mahal',
    76,
    1,
    'DH_31',
    'Root Canal Treatment @ per tooth',
    '84',
    '1',
    '3000',
    '',
    '0',
    '3000',
    3000,
    NULL,
    NULL,
    0,
    3000,
    'dg_4',
    '',
    'dtgh',
    '2024-04-27 20:31:42'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    112,
    51,
    86,
    'Madan Mahal',
    79,
    1,
    'DH_33',
    'Digital Compuler zcd XRay (R.V.G.)',
    '18',
    '1',
    '300',
    '',
    '50',
    '300',
    150,
    NULL,
    NULL,
    150,
    NULL,
    'dg_4',
    'Received',
    '',
    '2024-04-29 17:00:59'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    113,
    52,
    89,
    'Madan Mahal',
    81,
    1,
    'DH_35',
    'Root Canal Treatment @ per tooth',
    '18',
    '1',
    '3000',
    '',
    '5',
    '3000',
    2850,
    NULL,
    NULL,
    1350,
    1500,
    'dg_4',
    'Received',
    '',
    '2024-05-03 12:36:09'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    114,
    52,
    89,
    'Madan Mahal',
    82,
    2,
    'DH_35',
    'Root Canal Treatment @ per tooth',
    '18',
    '1',
    '3000',
    '',
    '0',
    '3000',
    3000,
    NULL,
    NULL,
    3000,
    0,
    'dg_4',
    'Pending',
    '',
    '2024-05-03 12:47:34'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    115,
    52,
    89,
    'Madan Mahal',
    82,
    2,
    'DH_35',
    'Root Canal Treatment @ per tooth',
    '18',
    '1',
    '3000',
    '',
    '0',
    '3000',
    3000,
    NULL,
    NULL,
    3000,
    0,
    'dg_4',
    'Received',
    '',
    '2024-05-03 12:56:26'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    116,
    54,
    90,
    'Madan Mahal',
    86,
    1,
    'DH_36',
    'Ceramic Braces',
    '27, 37',
    '2',
    '45000',
    '',
    '2',
    '90000',
    88200,
    NULL,
    NULL,
    88200,
    NULL,
    'dg_4',
    'Received',
    'treatment start 1st sitting',
    '2024-05-06 12:40:20'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    117,
    54,
    90,
    'Madan Mahal',
    87,
    1,
    'DH_36',
    'Ceramic Braces',
    '27, 37',
    '2',
    '45000',
    '',
    '10',
    '90000',
    81000,
    NULL,
    NULL,
    81000,
    NULL,
    'dg_4',
    'Received',
    'adad',
    '2024-05-07 11:04:55'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    118,
    55,
    93,
    'Madan Mahal',
    90,
    1,
    'DH_29',
    'Digital Compuler zcd XRay (R.V.G.)',
    '52, 51',
    '2',
    '300',
    '',
    '50',
    '600',
    300,
    NULL,
    NULL,
    300,
    NULL,
    'dg_4',
    'Received',
    'first sitting',
    '2024-05-07 14:21:00'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    119,
    56,
    94,
    'Madan Mahal',
    93,
    1,
    'DH_19',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    -49460,
    540,
    'dg_4',
    '',
    'sit-1 for treat-1',
    '2024-05-08 12:31:49'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    120,
    56,
    94,
    'Madan Mahal',
    93,
    1,
    'DH_19',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    -48920,
    540,
    'dg_4',
    '',
    '',
    '2024-05-08 12:46:21'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    121,
    56,
    94,
    'Madan Mahal',
    93,
    2,
    'DH_19',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    -48380,
    540,
    'dg_4',
    '',
    '',
    '2024-05-08 13:00:07'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    122,
    60,
    95,
    'Madan Mahal',
    96,
    1,
    '2',
    'Digital Compuler zcd XRay (R.V.G.)',
    '83',
    '1',
    '300',
    '',
    '1',
    '300',
    297,
    NULL,
    NULL,
    297,
    NULL,
    'dg_4',
    'Received',
    'test for single sitting ',
    '2024-05-08 17:05:24'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    123,
    55,
    93,
    'Madan Mahal',
    91,
    2,
    'DH_29',
    'Digital Compuler zcd XRay (R.V.G.)',
    '52, 51',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    540,
    NULL,
    'dg_4',
    'Received',
    '',
    '2024-05-08 21:49:18'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    124,
    56,
    94,
    'Madan Mahal',
    94,
    1,
    'DH_19',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '10',
    '600',
    540,
    NULL,
    NULL,
    -47840,
    540,
    'dg_4',
    '',
    '',
    '2024-05-09 11:18:11'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    125,
    56,
    94,
    'Madan Mahal',
    95,
    2,
    'DH_19',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '2',
    '600',
    588,
    NULL,
    NULL,
    588,
    588,
    'dg_4',
    '',
    '',
    '2024-05-09 18:31:27'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    126,
    56,
    94,
    'Madan Mahal',
    103,
    1,
    'DH_19',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '5',
    '600',
    570,
    NULL,
    NULL,
    570,
    570,
    'dg_4',
    'Received',
    '',
    '2024-05-09 18:37:43'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    127,
    56,
    94,
    'Madan Mahal',
    103,
    1,
    'DH_19',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '5',
    '600',
    570,
    NULL,
    NULL,
    570,
    570,
    'dg_4',
    'Received',
    '',
    '2024-05-09 18:48:50'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    128,
    56,
    94,
    'Madan Mahal',
    103,
    1,
    'DH_19',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55, 54',
    '2',
    '300',
    '',
    '2',
    '600',
    588,
    NULL,
    NULL,
    588,
    588,
    'dg_4',
    'Received',
    '',
    '2024-05-09 18:53:51'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    129,
    59,
    94,
    'Madan Mahal',
    103,
    1,
    'DH_19',
    'Biopsy',
    '53, 52',
    '2',
    '2500',
    '',
    '2',
    '5000',
    4900,
    NULL,
    NULL,
    4900,
    4900,
    'dg_4',
    'Received',
    '',
    '2024-05-10 15:05:03'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    130,
    63,
    98,
    'Madan Mahal',
    108,
    1,
    'DH_15',
    'Indirect Pulp Capping @ per tooth',
    '84',
    '1',
    '1500',
    '',
    '2',
    '1500',
    1470,
    NULL,
    NULL,
    1470,
    NULL,
    'dg_4',
    'Received',
    'dsavsd',
    '2024-05-10 15:51:42'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    131,
    66,
    101,
    'Madan Mahal',
    115,
    1,
    'DH_38',
    'Root Canal Treatment @ per tooth',
    '16, 15',
    '2',
    '3000',
    '',
    '0',
    '6000',
    6000,
    NULL,
    NULL,
    6000,
    1000,
    'dg_4',
    'Pending',
    '',
    '2024-05-11 12:51:28'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    132,
    67,
    102,
    'Madan Mahal',
    116,
    1,
    'DH_39',
    'Ceramic Braces',
    '17, 16',
    '2',
    '45000',
    '',
    '0',
    '90000',
    90000,
    NULL,
    NULL,
    50000,
    40000,
    'dg_4',
    'Received',
    'SDFS',
    '2024-05-11 13:03:23'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    133,
    69,
    103,
    'Madan Mahal',
    120,
    1,
    'DH_41',
    'Metal Braces',
    '54, 53',
    '2',
    '30000',
    '',
    '60',
    '60000',
    24000,
    NULL,
    NULL,
    4000,
    20000,
    'dg_4',
    'Received',
    'ffaad',
    '2024-05-11 15:46:26'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    134,
    69,
    103,
    'Madan Mahal',
    120,
    2,
    'DH_41',
    'Metal Braces',
    '54, 53',
    '2',
    '30000',
    '',
    '10',
    '60000',
    54000,
    NULL,
    NULL,
    54000,
    0,
    'dg_4',
    'Received',
    '',
    '2024-05-11 15:55:36'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    135,
    70,
    107,
    'Madan Mahal',
    119,
    1,
    'DH_40',
    'Digital Compuler zcd XRay (R.V.G.)',
    '15, 16',
    '2',
    '300',
    '',
    '0',
    '600',
    600,
    NULL,
    NULL,
    400,
    200,
    'dg_4',
    'Received',
    '',
    '2024-05-11 19:18:39'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    136,
    71,
    108,
    'Madan Mahal',
    122,
    1,
    'DH_42',
    'Porcelain Fused to Metal @ per Crown',
    '17',
    '1',
    '3000',
    '',
    '0',
    '3000',
    3000,
    NULL,
    NULL,
    1000,
    2000,
    'dg_4',
    'Pending',
    '',
    '2024-05-11 19:35:39'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    137,
    73,
    111,
    'Madan Mahal',
    123,
    1,
    'DH_37',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '10',
    '300',
    270,
    NULL,
    NULL,
    -730,
    270,
    'dg_4',
    'Received',
    '',
    '2024-05-13 17:54:18'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    138,
    73,
    111,
    'Madan Mahal',
    123,
    2,
    'DH_37',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '10',
    '300',
    270,
    NULL,
    NULL,
    270,
    270,
    'dg_4',
    'Received',
    '',
    '2024-05-13 17:35:47'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    139,
    73,
    111,
    'Madan Mahal',
    123,
    2,
    'DH_37',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '10',
    '300',
    270,
    NULL,
    NULL,
    -190,
    270,
    'dg_4',
    'Received',
    '',
    '2024-05-13 17:54:18'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    140,
    73,
    111,
    'Madan Mahal',
    123,
    2,
    'DH_37',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '10',
    '300',
    270,
    NULL,
    NULL,
    0,
    270,
    'dg_4',
    'Received',
    '',
    '2024-05-13 19:50:41'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    141,
    73,
    111,
    'Madan Mahal',
    123,
    2,
    'DH_37',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '10',
    '300',
    270,
    100,
    170,
    0,
    270,
    'dg_4',
    'Received',
    '',
    '2024-05-13 19:56:00'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    142,
    73,
    111,
    'Madan Mahal',
    123,
    2,
    'DH_37',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '10',
    '300',
    270,
    100,
    170,
    100,
    270,
    'dg_4',
    'Received',
    '',
    '2024-05-13 19:56:00'
  );
INSERT INTO
  `dental_treatment` (
    `id`,
    `exam_id`,
    `tp_id`,
    `branch_name`,
    `appointment_id`,
    `sitting_number`,
    `patient_uhid`,
    `dental_treatment`,
    `no_teeth`,
    `qty`,
    `cost_amt`,
    `original_cost_amt`,
    `disc_amt`,
    `total_amt`,
    `net_amount`,
    `paid_amount`,
    `pending_amount`,
    `dir_rec_amt`,
    `sec_rec_amt`,
    `dir_rec_doctor_id`,
    `sitting_payment_status`,
    `note`,
    `date`
  )
VALUES
  (
    143,
    73,
    111,
    'Madan Mahal',
    123,
    2,
    'DH_37',
    'Digital Compuler zcd XRay (R.V.G.)',
    '55',
    '1',
    '300',
    '',
    '10',
    '300',
    270,
    270,
    0,
    0,
    270,
    'dg_4',
    '',
    '',
    '2024-05-13 19:59:47'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: drugs
# ------------------------------------------------------------

INSERT INTO
  `drugs` (
    `drug_id`,
    `HSN_code`,
    `item_code`,
    `drug_name`,
    `drug_strength`,
    `instruction`,
    `branch_name`
  )
VALUES
  (7, '1240', '25', 'PARA', '250mg', 'tds', 'Madan Mahal');
INSERT INTO
  `drugs` (
    `drug_id`,
    `HSN_code`,
    `item_code`,
    `drug_name`,
    `drug_strength`,
    `instruction`,
    `branch_name`
  )
VALUES
  (
    8,
    '123sd',
    'xwx3',
    'smd',
    '500mg',
    'bd',
    'Madan Mahal'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: employee_attendance
# ------------------------------------------------------------

INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    10,
    'dg_5',
    'shadab',
    'Madan Mahal',
    'receptionist',
    '2024-04-25',
    NULL,
    NULL,
    NULL,
    NULL,
    '21:06:56.000000',
    '21:07:35.000000',
    'yes'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    14,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'lab attendant',
    '2024-04-13',
    NULL,
    NULL,
    NULL,
    NULL,
    '16:07:53.000000',
    '16:08:09.000000',
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    15,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'lab attendant',
    '2024-04-15',
    NULL,
    NULL,
    NULL,
    NULL,
    '14:48:34.000000',
    NULL,
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    16,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'lab attendant',
    '2024-04-16',
    NULL,
    NULL,
    NULL,
    NULL,
    '16:35:12.000000',
    NULL,
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    17,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'lab attendant',
    '2024-04-18',
    NULL,
    NULL,
    NULL,
    NULL,
    '11:11:15.000000',
    NULL,
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    18,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'lab attendant',
    '2024-04-20',
    NULL,
    NULL,
    NULL,
    NULL,
    '16:00:21.000000',
    '16:00:26.000000',
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    19,
    'dg_1',
    'umer',
    'Madan Mahal',
    'doctor',
    '2024-04-25',
    NULL,
    NULL,
    NULL,
    NULL,
    '09:00:00.000000',
    '17:00:00.000000',
    'yes'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    20,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'admin',
    '2024-04-24',
    NULL,
    NULL,
    NULL,
    NULL,
    '12:54:45.000000',
    NULL,
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    21,
    'dg_4',
    'shadab',
    'Madan Mahal',
    'receptionist',
    '2024-04-24',
    NULL,
    NULL,
    NULL,
    NULL,
    '15:18:51.000000',
    '17:08:26.000000',
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    24,
    'dg_4',
    'shadab',
    'Madan Mahal',
    'doctor',
    '2024-04-25',
    NULL,
    NULL,
    NULL,
    NULL,
    '17:58:36.000000',
    '17:58:52.000000',
    'no'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    26,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'admin',
    '2024-04-26',
    NULL,
    NULL,
    NULL,
    NULL,
    '16:59:44.000000',
    NULL,
    'yes'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    27,
    'dg_4',
    'shadab',
    'Madan Mahal',
    'doctor',
    '2024-04-27',
    NULL,
    NULL,
    NULL,
    NULL,
    '08:02:23.000000',
    NULL,
    'yes'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    28,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'admin',
    '2024-04-27',
    NULL,
    NULL,
    NULL,
    NULL,
    '08:09:15.000000',
    '12:35:52.000000',
    'no'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    29,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'admin',
    '2024-04-29',
    NULL,
    NULL,
    NULL,
    NULL,
    '19:37:36.000000',
    NULL,
    'yes'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    30,
    'dg_4',
    'shadab',
    'Madan Mahal',
    'doctor',
    '2024-05-04',
    NULL,
    NULL,
    NULL,
    NULL,
    '15:30:47.000000',
    '00:39:26.000000',
    'yes'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    31,
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-04',
    NULL,
    NULL,
    NULL,
    NULL,
    '13:11:58.000000',
    NULL,
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    32,
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-04',
    NULL,
    NULL,
    NULL,
    NULL,
    '13:12:00.000000',
    NULL,
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    33,
    'dg_4',
    'shadab',
    'Madan Mahal',
    'doctor',
    '2024-05-06',
    NULL,
    NULL,
    NULL,
    NULL,
    '10:59:38.000000',
    NULL,
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    34,
    'dg_4',
    'shadab',
    'Madan Mahal',
    'doctor',
    '2024-05-08',
    NULL,
    NULL,
    NULL,
    NULL,
    '13:15:30.000000',
    '14:44:35.000000',
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    35,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'consultant',
    '2024-05-08',
    NULL,
    NULL,
    NULL,
    NULL,
    '14:47:03.000000',
    NULL,
    'yes'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    36,
    'dg_4',
    'shadab',
    'Madan Mahal',
    'doctor',
    '2024-05-10',
    NULL,
    NULL,
    NULL,
    NULL,
    '11:52:46.000000',
    '11:52:59.000000',
    'no'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    37,
    'dg_6',
    'anas',
    'Madan Mahal',
    'lab',
    '2024-05-10',
    NULL,
    NULL,
    NULL,
    NULL,
    '16:33:39.000000',
    '18:16:05.000000',
    'no'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    38,
    'dg_4',
    'shadab',
    'Madan Mahal',
    'doctor',
    '2024-05-11',
    NULL,
    NULL,
    NULL,
    NULL,
    '11:37:47.000000',
    '12:35:40.000000',
    'yes'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    39,
    'dg_6',
    'anas',
    'Madan Mahal',
    'lab',
    '2024-05-11',
    NULL,
    NULL,
    NULL,
    NULL,
    '12:16:52.000000',
    '12:17:32.000000',
    'no'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    40,
    'dg_6',
    'anas',
    'Madan Mahal',
    'lab',
    '2024-05-13',
    NULL,
    NULL,
    NULL,
    NULL,
    '12:55:45.000000',
    '12:56:57.000000',
    'no'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    41,
    'dg_4',
    'shadab',
    'Madan Mahal',
    'doctor',
    '2024-05-13',
    NULL,
    NULL,
    NULL,
    NULL,
    '14:53:41.000000',
    NULL,
    'yes'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    42,
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-13',
    NULL,
    NULL,
    NULL,
    NULL,
    '17:14:37.000000',
    NULL,
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    43,
    NULL,
    NULL,
    NULL,
    NULL,
    '2024-05-13',
    NULL,
    NULL,
    NULL,
    NULL,
    '17:14:52.000000',
    NULL,
    NULL
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    44,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'consultant',
    '2024-05-22',
    NULL,
    NULL,
    NULL,
    NULL,
    '15:51:00.000000',
    '15:53:26.000000',
    'no'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    45,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'consultant',
    '2024-05-23',
    NULL,
    NULL,
    NULL,
    NULL,
    '17:06:20.000000',
    NULL,
    'yes'
  );
INSERT INTO
  `employee_attendance` (
    `attendance_id`,
    `employee_ID`,
    `emp_name`,
    `branch`,
    `employee_designation`,
    `date`,
    `morning_shift_login_time`,
    `morning_shift_logout_time`,
    `evening_shift_login_time`,
    `evening_shift_logout_time`,
    `allday_shift_login_time`,
    `allday_shift_logout_time`,
    `availability`
  )
VALUES
  (
    46,
    'dg_5',
    'vijendra',
    'Madan Mahal',
    'consultant',
    '2024-05-24',
    NULL,
    NULL,
    NULL,
    NULL,
    '19:44:51.000000',
    NULL,
    'yes'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: employee_complaints
# ------------------------------------------------------------

INSERT INTO
  `employee_complaints` (
    `complain_id`,
    `emp_id`,
    `employee_name`,
    `branch_name`,
    `complain`,
    `rec_on`,
    `status`,
    `solved_on`,
    `pending_since`
  )
VALUES
  (
    1,
    'dg_1',
    'umer',
    'Madan Mahal',
    'I want more salary',
    '2024-02-27 13:00:00.000000',
    'Solved',
    '2024-03-11 00:00:00.000000',
    NULL
  );
INSERT INTO
  `employee_complaints` (
    `complain_id`,
    `emp_id`,
    `employee_name`,
    `branch_name`,
    `complain`,
    `rec_on`,
    `status`,
    `solved_on`,
    `pending_since`
  )
VALUES
  (
    2,
    'dg_2',
    'shubham',
    'Vijay Nagar',
    'I want more salary',
    '2024-02-27 11:00:00.000000',
    'Pending',
    NULL,
    NULL
  );
INSERT INTO
  `employee_complaints` (
    `complain_id`,
    `emp_id`,
    `employee_name`,
    `branch_name`,
    `complain`,
    `rec_on`,
    `status`,
    `solved_on`,
    `pending_since`
  )
VALUES
  (
    3,
    'dg_2',
    'shubham',
    'Vijay Nagar',
    'I want more salary',
    '2024-02-27 00:00:00.000000',
    'Pending',
    NULL,
    NULL
  );
INSERT INTO
  `employee_complaints` (
    `complain_id`,
    `emp_id`,
    `employee_name`,
    `branch_name`,
    `complain`,
    `rec_on`,
    `status`,
    `solved_on`,
    `pending_since`
  )
VALUES
  (
    4,
    'dg_1',
    'umer',
    'Madan Mahal',
    'I want more salary',
    '2024-03-05 13:00:00.000000',
    'Solved',
    '2024-03-11 00:00:00.000000',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: employee_leave
# ------------------------------------------------------------

INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    8,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-04-11,2024-04-12',
    '',
    'Approved',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    11,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-04-11',
    '',
    'pending',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    14,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-04-11',
    'ff',
    'pending',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    17,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-04-11,2024-04-12,2024-04-13',
    'gg',
    'pending',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    18,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-04-11,2024-04-12,2024-04-14',
    'some',
    'pending',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    20,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-04-02,2024-04-03,2024-04-04',
    'on leave',
    'pending',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    25,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-06-11,2024-06-12',
    'fdf',
    'pending',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    27,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-04-11,2024-04-12,2024-04-23',
    'fd',
    'pending',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    28,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-04-30',
    'df',
    'pending',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    29,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-05-10',
    'ff',
    'pending',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    30,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-07-18',
    'ff',
    'pending',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    31,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-08-15',
    'dd',
    'pending',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    32,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-04-26',
    'fff',
    'Rejected',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    33,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-05-01',
    'ok',
    'Rejected',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    34,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-04-25',
    'ok',
    'Approved',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    35,
    'Madan Mahal',
    'dg_5',
    'vijendra',
    '2024-04-20,2024-04-19,2024-04-18',
    'hello world',
    'Approved',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    36,
    'Madan Mahal',
    'dg_5',
    'vijendra',
    '2024-04-14,2024-04-16',
    'ok',
    'Approved',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    37,
    'Madan Mahal',
    'dg_5',
    'vijendra',
    '2024-04-10,2024-04-11,2024-04-12',
    'joi',
    'Rejected',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    40,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-06-01',
    'test mohit',
    'Approved',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    43,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-04-01',
    'going to goa ',
    'Approved',
    '2024-04-25 14:32:51.719070'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    44,
    'Madan Mahal',
    'dg_5',
    'vijendra',
    '2024-05-01',
    'just like ',
    'pending',
    '2024-04-27 09:18:21.781001'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    45,
    'Madan Mahal',
    'dg_5',
    'vijendra',
    '2024-05-03',
    'ok',
    'Approved',
    '2024-04-27 15:49:11.946841'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    47,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-05-02',
    'dsdfse',
    'Approved',
    '2024-05-02 15:31:01.177984'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    48,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-05-22',
    'umer h resason',
    'Rejected',
    '2024-05-08 16:12:11.838785'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    49,
    'Madan Mahal',
    'dg_4',
    'shadab',
    '2024-05-09',
    'h',
    'Approved',
    '2024-05-10 11:53:44.049493'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    50,
    'Madan Mahal',
    'dg_6',
    'anas',
    '2024-05-09',
    'umer health',
    'Rejected',
    '2024-05-10 16:41:28.135798'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    51,
    'Madan Mahal',
    'dg_6',
    'anas',
    '2024-05-12',
    'meri mrji',
    'Rejected',
    '2024-05-11 12:17:19.126720'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    52,
    'Madan Mahal',
    'dg_6',
    'anas',
    '2024-05-14',
    'm ni btaunga',
    'Approved',
    '2024-05-13 12:56:25.341902'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    53,
    'Madan Mahal',
    'dg_5',
    'vijendra',
    '2024-05-14',
    'just like',
    'Approved',
    '2024-05-13 17:20:34.258581'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    54,
    'Madan Mahal',
    'dg_5',
    'vijendra',
    '2024-05-22',
    'going to dubai',
    'Approved',
    '2024-05-22 15:54:04.348000'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    55,
    'Madan Mahal',
    'dg_5',
    'vijendra',
    '2024-05-23',
    'zxczx',
    'Approved',
    '2024-05-23 17:20:19.985046'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    56,
    'Madan Mahal',
    'dg_5',
    'vijendra',
    '2024-05-25',
    'ok',
    'Approved',
    '2024-05-24 19:38:06.107447'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    57,
    'Madan Mahal',
    'dg_5',
    'vijendra',
    '2024-05-16',
    'ok',
    'Rejected',
    '2024-05-24 19:45:03.492409'
  );
INSERT INTO
  `employee_leave` (
    `id`,
    `branch_name`,
    `employee_ID`,
    `employee_name`,
    `leave_dates`,
    `leave_reason`,
    `leave_status`,
    `created_at`
  )
VALUES
  (
    58,
    'Madan Mahal',
    'dg_5',
    'vijendra',
    '2024-05-24',
    'd',
    'pending',
    '2024-05-25 11:43:21.091010'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: employee_register
# ------------------------------------------------------------

INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    1,
    'dg_1',
    'Madan Mahal',
    'shubham',
    '8602161019',
    'umer@gmail.com',
    'male',
    'doctor',
    '$2b$10$7oAX2F11um8RtXe4dwHHDu4WYSxg1RgrnqVqFG9zPLpXD0Tm2cM1O',
    'doctor, admin',
    '30000',
    'Ranjhi, Jabalpur',
    'Approved',
    '10:00:00.000000',
    '14:00:00.000000',
    '16:00:00.000000',
    '20:00:00.000000',
    '10:30:00.000000',
    '19:00:00.000000',
    'mon-fri',
    'yes',
    'http://localhost:8888/empProfilePicture/17165535296014904301-RavindraTomar.png',
    'null',
    'null',
    'null',
    'null',
    'null'
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    2,
    'dg_2',
    'Madan Mahal',
    'shubham',
    '8602161019',
    'vikram@gmail.com',
    'male',
    'doctor',
    '$2b$10$pyFDTpDQf7WWxs8FIE0YLuBT6n0ZzBBeLFPohm3qwEvbTRV2rUvgG',
    'admin,receptionist',
    '50000',
    'Madan Mahal, Jabalpur',
    'Approved',
    '10:00:00.000000',
    '14:00:00.000000',
    '16:00:00.000000',
    '20:00:00.000000',
    '10:30:41.769000',
    '19:00:41.118000',
    'mon-fri',
    'yes',
    'https://dentalgurusuperadmin.doaguru.com/empProfilePicture/1709303771914bb3.png',
    'Advanced Orthodontic Training - Institute of Orthodontics  Cityville State, Doctor of Dental Medicine (DMD) - University of Dental Sciences Cityville State',
    'Orthodontics, Endodontics',
    'English, Hindi',
    '15 years',
    'Full Time'
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    4,
    'dg_3',
    'Madan Mahal',
    'Vinay singh',
    '8602161019',
    'vinay@gmail.com',
    'Male',
    'doctor',
    'vinay',
    'doctor',
    '50000',
    'jabalpur',
    'Pending',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    NULL,
    'yes',
    'https://dentalgurusuperadmin.doaguru.com/empProfilePicture/1709278594627chaitanya img.jpg',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    5,
    'dg_4',
    'Madan Mahal',
    'shadab',
    '8602161019',
    'shadab@gmail.com',
    'male',
    'doctor',
    '$2b$10$2YcG82plPpSPv81SRIrRieTjV161MNFVdqXtcq2THlrW9ROBqYC1e',
    'doctor,receptionist',
    '50000',
    'Jabalpur',
    'Approved',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '10:00:00.000000',
    '19:00:00.000000',
    NULL,
    'yes',
    'https://dentalgurusuperadmin.doaguru.com/empProfilePicture/17104102635691709210206279kd.jpg',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    6,
    'dg_5',
    'Madan Mahal',
    'vijendra',
    '8602161019',
    'kuldeepdoauruinfosystems@gmail.com',
    'male',
    'consultant',
    '$2b$10$nmZnD5IAYnkr8USo/3p3SujB5V2UDJIEg4aG04Yt5GfzrATEMkAFW',
    'admin,lab attendant, accountant',
    '60000',
    'Jabalpur',
    'Approved',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '10:00:00.000000',
    '19:00:00.000000',
    'mon-fri',
    'yes',
    'https://dentalgurusuperadmin.doaguru.com/empProfilePicture/1709629184551bear.jpg',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    7,
    'dg_6',
    'Madan Mahal',
    'anas',
    '8602161020',
    'umerqureshidoaguru@gmail.com',
    'male',
    'lab',
    '$2a$10$cPyHT/Z9dzRiJka.fkWspOO43v0mzFGG5negMISNDyZ2V5fESc0U2',
    'lab-attendant',
    '50000',
    'Jabalpur',
    'Approved',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '10:00:00.000000',
    '19:00:00.000000',
    'mon-fri',
    'yes',
    'https://dentalgurusuperadmin.doaguru.com/empProfilePicture/1709629307062bear.jpg',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    8,
    'dg_7',
    'Madan Mahal',
    'subham soni',
    '7068272208',
    'soni@gmail.com',
    'female',
    'receptionist',
    'soni',
    'receptionist',
    '15000',
    '420, Gwarighat, Jabalpur',
    'approved',
    '10:00:00.000000',
    '14:00:00.000000',
    '16:00:00.000000',
    '20:00:00.000000',
    '10:00:00.000000',
    '20:00:00.000000',
    '7',
    '',
    'https://dentalgurusuperadmin.doaguru.com/empProfilePicture/1710224578687lifesupport.png',
    'null',
    'null',
    'null',
    'null',
    'half time'
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    9,
    'dg_8',
    'Madan Mahal',
    'test',
    'test',
    'test@gmail.com',
    'male',
    'doctor',
    '$2a$10$.mNbmBgXX5s/xLbEm2lUOO0YIUcj4Gn6ruU8xZB3Mkq9jC5his/k6',
    'doctor',
    '50000',
    'Jabalpur',
    'onboard',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    'mon-fri',
    '',
    'https://dentalgurusuperadmin.doaguru.com/empProfilePicture/17104102635691709210206279kd.jpg',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    10,
    'dg_9',
    'Madan Mahal',
    'subham soni',
    '72584975663',
    'cygf@gmail.com',
    'female',
    'receptionist',
    '$2a$10$esmo5GbU9vjc51uFkAz5ceIrUx7EwjkiENIv3R9CoqC3RWJ9kYbI2',
    'receptionist',
    '150',
    '420, Gwarighat, Jabalpur',
    'approved',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '08:00:00.000000',
    '16:00:00.000000',
    '7',
    '',
    'https://dentalgurusuperadmin.doaguru.com/empProfilePicture/1710412310938Disabletest.png',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    11,
    'dg_10',
    'Madan Mahal',
    'damodar ',
    '8602161019',
    'damodar@gmail.com',
    'male',
    'doctor',
    '$2a$10$iLz4HcHB3rkQBj5PGSA19O4sG6MFpnaXzBzkUSq8l03qnYAkCnvke',
    'doctor',
    '50000',
    'Madan Mahal, Jabalpur',
    'pending',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '10:00:00.000000',
    '19:00:00.000000',
    'Mon-Fri',
    '',
    'https://dentalguruadmin.doaguru.com/empProfilePicture/1714651870468pexels-george-dsilva-3254563.jpg',
    'Test',
    'test',
    'English, Hindi',
    '10 Years',
    'full time'
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    12,
    'dg_11',
    'Madan Mahal',
    'mohit',
    '1236878487465312013',
    'mohitsahu1993@gmail.com',
    'male',
    'doctor',
    '$2a$10$SIaqvkNK9zugZtnmxBXOPuj6w0RJpec9s2Nd8Wp6VoU/IhH2cTcq2',
    'doctor',
    '50000',
    'jabalpur',
    'Approved',
    '10:00:00.000000',
    '14:00:00.000000',
    '18:00:00.000000',
    '22:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '6',
    '',
    'https://dentalguruadmin.doaguru.com/empProfilePicture/1715595590387lari dr.png',
    'b.tech',
    'MD ',
    'english',
    '500yr',
    NULL
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    13,
    'dg_12',
    'Madan Mahal',
    'keshav',
    '1111111111',
    'aaa@gmail.com',
    'male',
    'admin',
    '$2b$10$vYVZV6R.JqUWhIW8np3uFeXDPboAqA.RgKyO5lGC/bcejs2Azb70C',
    'receptionist',
    '',
    'dss',
    'pending',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '19:04:00.000000',
    '22:04:00.000000',
    '',
    '',
    '8888/empProfilePicture/17164714704654261702-KC_Tomar.png',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    14,
    'dg_13',
    'Madan Mahal',
    'raj',
    '1111111111',
    'mohit@gmail.com',
    'male',
    'admin',
    '$2b$10$gbcakUH0SJPEOkya1ypUbu5fk9mpCSH35KDc087jSJAdE2/alRIMW',
    'admin',
    '50000',
    'Jabalpur',
    'onboard',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '',
    '',
    '8888/empProfilePicture/17164734932984261702-KC_Tomar.png',
    NULL,
    NULL,
    NULL,
    NULL,
    'full-time'
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    15,
    'dg_14',
    'Madan Mahal',
    'anas soni',
    '1234',
    'test1@gmail.com',
    'male',
    'doctor',
    '1234',
    'doctor,receptionist,lab attendant',
    '50000',
    'Jabalpur',
    'approved',
    '21:04:00.000000',
    '21:04:00.000000',
    '20:05:00.000000',
    '20:04:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    'mon-fri',
    '',
    'http://localhost:8888/empProfilePicture/17165444895374261702-KC_Tomar.png',
    'bbbb',
    'bbbb',
    'aaaaaa',
    '1',
    'half time'
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    16,
    'dg_15',
    'Madan Mahal',
    'mohit',
    '8602161019',
    'mohitsahu@gmail.com',
    'male',
    'lab attendant',
    '$2b$10$uFl15sKzHtrf1dC4i00whORkeEPZ61NhafR/yvivOydvLcNp1th1K',
    'admin,receptionist,consultant',
    '12345',
    'Jabalpur',
    'Approved',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '16:57:00.000000',
    '20:57:00.000000',
    'mon-fri',
    '',
    '8888/empProfilePicture/17165464921064904301-RavindraTomar.png',
    '',
    '',
    '',
    '',
    'full time'
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    17,
    'dg_16',
    'Madan Mahal',
    'shadab',
    '8602161019',
    'test3@gmail.com',
    'male',
    'admin',
    '$2b$10$mmmzMxyNKdC.O8jU0PmXO.jPtjuQJ31nys9sc2.qEoDFNrU88f5GG',
    'admin',
    '50000',
    'Jabalpur',
    'approved',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '18:11:00.000000',
    '17:11:00.000000',
    'mon-fri',
    '',
    '8888/empProfilePicture/17165473208254261702-KC_Tomar.png',
    '',
    '',
    '',
    '',
    'full time'
  );
INSERT INTO
  `employee_register` (
    `sr_id`,
    `employee_ID`,
    `branch_name`,
    `employee_name`,
    `employee_mobile`,
    `employee_email`,
    `gender`,
    `employee_designation`,
    `employee_password`,
    `employee_role`,
    `salary`,
    `address`,
    `employee_status`,
    `morning_shift_start_time`,
    `morning_shift_end_time`,
    `evening_shift_start_time`,
    `evening_shift_end_time`,
    `allday_shift_start_time`,
    `allday_shift_end_time`,
    `working_days`,
    `availability`,
    `employee_picture`,
    `employee_education`,
    `speciality`,
    `language`,
    `experience`,
    `type_of`
  )
VALUES
  (
    18,
    'dg_17',
    'Madan Mahal',
    'umer',
    '8602161019',
    'son1i@gmail.com',
    'male',
    'admin',
    '$2b$10$VAZHAWPHisMwypsSOL9y7OaLTaW.hd/rHG75j2Q.46Zzn8/c/UDoe',
    'admin',
    '50000',
    'Jabalpur',
    'approved',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '00:00:00.000000',
    '16:49:00.000000',
    '18:47:00.000000',
    'mon-fri',
    '',
    '8888/empProfilePicture/17165494698734904301-RavindraTomar.png',
    '',
    '',
    '',
    '',
    'full time'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: employee_timeline
# ------------------------------------------------------------

INSERT INTO
  `employee_timeline` (
    `event_id`,
    `branch_name`,
    `title`,
    `event_msg`,
    `open`,
    `status`,
    `time`
  )
VALUES
  (
    1,
    'Madan Mahal',
    'new employee registered',
    'please approve so that they can start work please approve so that they can start work',
    '/manage-staff',
    'read',
    '2024-03-07 19:51:38.925099'
  );
INSERT INTO
  `employee_timeline` (
    `event_id`,
    `branch_name`,
    `title`,
    `event_msg`,
    `open`,
    `status`,
    `time`
  )
VALUES
  (
    2,
    'Madan Mahal',
    'new employee registered',
    'please approve so that they can start work',
    '/manage-staff',
    'read',
    '2024-03-07 19:51:38.925099'
  );
INSERT INTO
  `employee_timeline` (
    `event_id`,
    `branch_name`,
    `title`,
    `event_msg`,
    `open`,
    `status`,
    `time`
  )
VALUES
  (
    3,
    'Madan Mahal',
    'new employee registered',
    'please approve so that they can start work please approve so that they can start work',
    '/manage-staff',
    'read',
    '2024-03-07 19:51:38.925099'
  );
INSERT INTO
  `employee_timeline` (
    `event_id`,
    `branch_name`,
    `title`,
    `event_msg`,
    `open`,
    `status`,
    `time`
  )
VALUES
  (
    4,
    'Madan Mahal',
    'new employee registered',
    'please approve so that they can start work please approve so that they can start work',
    '/manage-staff',
    'read',
    '2024-03-07 19:51:38.925099'
  );
INSERT INTO
  `employee_timeline` (
    `event_id`,
    `branch_name`,
    `title`,
    `event_msg`,
    `open`,
    `status`,
    `time`
  )
VALUES
  (
    5,
    'Madan Mahal',
    'new employee registered',
    'please approve so that they can start work',
    '/manage-staff',
    'read',
    '2024-03-11 14:59:11.564259'
  );
INSERT INTO
  `employee_timeline` (
    `event_id`,
    `branch_name`,
    `title`,
    `event_msg`,
    `open`,
    `status`,
    `time`
  )
VALUES
  (
    6,
    'Madan Mahal',
    'test',
    'please approve so that they can start work',
    '/manage-staff',
    'read',
    '2024-03-11 14:59:46.517579'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: examin_details
# ------------------------------------------------------------

INSERT INTO
  `examin_details` (
    `examin_id`,
    `uhid`,
    `branch_name`,
    `examin_date`,
    `examin_issue`,
    `examin_investigation`,
    `tooth`,
    `diagnosis`,
    `doctor_name`
  )
VALUES
  (
    1,
    'DH0001',
    'Madan Mahal',
    '2024-03-03 13:33:58.000000',
    'Tooth Decay',
    'Decayed',
    '26',
    'Tooth infection',
    'dev'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: expense_voucher
# ------------------------------------------------------------

INSERT INTO
  `expense_voucher` (
    `voucher_id`,
    `branch_name`,
    `for_name`,
    `for_use`,
    `voucher_amount`,
    `voucher_date`,
    `created_by`
  )
VALUES
  (
    1,
    'Madan Mahal',
    'shubham',
    'coffee',
    100,
    '2024-03-22 16:11:52',
    'dev'
  );
INSERT INTO
  `expense_voucher` (
    `voucher_id`,
    `branch_name`,
    `for_name`,
    `for_use`,
    `voucher_amount`,
    `voucher_date`,
    `created_by`
  )
VALUES
  (
    2,
    'Madan Mahal',
    'shubham',
    'tea',
    100,
    '2024-04-07 00:00:00',
    'kuldeepdoauruinfosystems@gmail.com'
  );
INSERT INTO
  `expense_voucher` (
    `voucher_id`,
    `branch_name`,
    `for_name`,
    `for_use`,
    `voucher_amount`,
    `voucher_date`,
    `created_by`
  )
VALUES
  (
    3,
    'Madan Mahal',
    'shubham',
    'tea',
    100,
    '2024-04-07 00:00:00',
    'kuldeepdoauruinfosystems@gmail.com'
  );
INSERT INTO
  `expense_voucher` (
    `voucher_id`,
    `branch_name`,
    `for_name`,
    `for_use`,
    `voucher_amount`,
    `voucher_date`,
    `created_by`
  )
VALUES
  (
    4,
    'Madan Mahal',
    'mohit',
    'nasta',
    1,
    '2024-04-13 00:00:00',
    'kuldeepdoauruinfosystems@gmail.com'
  );
INSERT INTO
  `expense_voucher` (
    `voucher_id`,
    `branch_name`,
    `for_name`,
    `for_use`,
    `voucher_amount`,
    `voucher_date`,
    `created_by`
  )
VALUES
  (
    5,
    'Madan Mahal',
    'DOAguru',
    'PC',
    10000,
    '2024-04-22 00:00:00',
    'dev ansh'
  );
INSERT INTO
  `expense_voucher` (
    `voucher_id`,
    `branch_name`,
    `for_name`,
    `for_use`,
    `voucher_amount`,
    `voucher_date`,
    `created_by`
  )
VALUES
  (
    6,
    'Madan Mahal',
    'DOAguru',
    'PC DOAGuru',
    6000,
    '2024-04-23 00:00:00',
    'dev Developer'
  );
INSERT INTO
  `expense_voucher` (
    `voucher_id`,
    `branch_name`,
    `for_name`,
    `for_use`,
    `voucher_amount`,
    `voucher_date`,
    `created_by`
  )
VALUES
  (
    7,
    'Madan Mahal',
    'soni ji',
    'banana shake',
    70,
    '2024-04-27 00:00:00',
    'kuldeepdoauruinfosystems@gmail.com'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: holidays
# ------------------------------------------------------------

INSERT INTO
  `holidays` (
    `holiday_id`,
    `branch_name`,
    `holiday_name`,
    `holiday_date`,
    `holiday_start_time`,
    `holiday_end_time`,
    `notes`
  )
VALUES
  (
    3,
    'Madan Mahal',
    ' shivrat',
    '2024-05-09',
    '03:09:00.000000',
    '02:09:00.000000',
    'closessqqqqq'
  );
INSERT INTO
  `holidays` (
    `holiday_id`,
    `branch_name`,
    `holiday_name`,
    `holiday_date`,
    `holiday_start_time`,
    `holiday_end_time`,
    `notes`
  )
VALUES
  (
    5,
    'Madan Mahal',
    ' shivratri',
    '2024-03-14',
    '10:00:00.000000',
    '17:00:00.000000',
    'close'
  );
INSERT INTO
  `holidays` (
    `holiday_id`,
    `branch_name`,
    `holiday_name`,
    `holiday_date`,
    `holiday_start_time`,
    `holiday_end_time`,
    `notes`
  )
VALUES
  (
    6,
    'Madan Mahal',
    'ssd',
    '2024-04-11',
    '13:23:00.000000',
    '01:24:00.000000',
    'ss'
  );
INSERT INTO
  `holidays` (
    `holiday_id`,
    `branch_name`,
    `holiday_name`,
    `holiday_date`,
    `holiday_start_time`,
    `holiday_end_time`,
    `notes`
  )
VALUES
  (
    12,
    'Madan Mahal',
    'aaa',
    '4444-02-23',
    '03:44:00.000000',
    '14:01:00.000000',
    'dd'
  );
INSERT INTO
  `holidays` (
    `holiday_id`,
    `branch_name`,
    `holiday_name`,
    `holiday_date`,
    `holiday_start_time`,
    `holiday_end_time`,
    `notes`
  )
VALUES
  (
    16,
    'Madan Mahal',
    'aaa',
    '2024-05-30',
    '16:08:00.000000',
    '04:11:00.000000',
    'ddw'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: inquiries
# ------------------------------------------------------------

INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    4,
    NULL,
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    'dg_1',
    'umer',
    '2024-03-16 16:11:12.866',
    '2024-03-16 16:11:12'
  );
INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    5,
    NULL,
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    'dg_1',
    'umer',
    '2024-03-16 16:11:59.165',
    '2024-03-16 16:11:59'
  );
INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    6,
    NULL,
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    'dg_1',
    'umer',
    '2024-03-16 16:12:46.500',
    '2024-03-16 16:12:46'
  );
INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    9,
    NULL,
    'rahul',
    '8966446565',
    '',
    'Male',
    '',
    '',
    'dsdsd',
    '',
    '',
    '2024-03-16 16:49:44.028',
    '2024-03-16 16:49:44'
  );
INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    10,
    NULL,
    'shubham',
    '9816565466',
    '',
    'Male',
    '30',
    'any',
    'no',
    'dg_4',
    'shadab',
    '2024-03-16 16:52:08.041',
    '2024-03-16 16:52:08'
  );
INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    12,
    'Madan Mahal',
    'ravi',
    '9806324244',
    'mohitsahu1993@gmail.com',
    'Male',
    '',
    '',
    'no',
    'dg_1',
    'umer',
    '2024-03-16 16:53:51.905',
    '2024-04-01 15:56:01'
  );
INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    13,
    'Madan Mahal',
    'ajay',
    '8745545584',
    '',
    'Male',
    '',
    '',
    'some note',
    'dg_4',
    'shadab',
    '2024-03-16 17:02:58.685',
    '2024-03-16 17:02:58'
  );
INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    20,
    'Madan Mahal',
    'Umer Baba',
    '1112223330',
    'umer@gmail.com',
    'Female',
    '24',
    'Patan',
    'kab aana h',
    'dg_1',
    'shubham',
    '2024-04-25 15:26:38.080',
    '2024-04-25 12:56:38'
  );
INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    21,
    'Madan Mahal',
    'Umer Baba',
    '1112223330',
    'umer@gmail.com',
    'Female',
    '24',
    'Patan',
    'kab aana h',
    'dg_1',
    'shubham',
    '2024-04-25 15:26:38.091',
    '2024-04-25 12:56:38'
  );
INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    22,
    'Madan Mahal',
    'Umer Baba',
    '1112223330',
    'umer@gmail.com',
    'Female',
    '24',
    'Patan',
    'kab aana h',
    'dg_1',
    'shubham',
    '2024-04-25 15:26:38.092',
    '2024-04-25 12:56:38'
  );
INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    23,
    'Madan Mahal',
    'Umer Baba',
    '1112223330',
    'umer@gmail.com',
    'Female',
    '24',
    'Patan',
    'kab aana h',
    'dg_1',
    'shubham',
    '2024-04-25 15:26:38.160',
    '2024-04-25 12:56:38'
  );
INSERT INTO
  `inquiries` (
    `id`,
    `branch`,
    `patient_name`,
    `mobile`,
    `email`,
    `gender`,
    `age`,
    `address`,
    `notes`,
    `doctorId`,
    `doctorName`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    24,
    'Madan Mahal',
    'vinay ',
    '8318864691',
    'vinaydhariya21@gmail.com',
    'Male',
    '26',
    'gupta colony',
    'timing',
    'dg_4',
    'shadab',
    '2024-05-10 19:53:01.578',
    '2024-05-10 17:23:46'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: lab_details
# ------------------------------------------------------------

INSERT INTO
  `lab_details` (
    `lab_id`,
    `branch_name`,
    `lab_name`,
    `lab_type`,
    `lab_contact`,
    `lab_email`,
    `address`,
    `status`
  )
VALUES
  (
    1,
    'Madan Mahal',
    'blood',
    'internal',
    '8602161019',
    'mahesh@gmail.com',
    'Madan Mahal',
    'active'
  );
INSERT INTO
  `lab_details` (
    `lab_id`,
    `branch_name`,
    `lab_name`,
    `lab_type`,
    `lab_contact`,
    `lab_email`,
    `address`,
    `status`
  )
VALUES
  (
    2,
    'Madan Mahal',
    'radiology',
    'internal',
    '8602161019',
    'maheshtest@gmail.com',
    'Madan Mahal, Jabalpur',
    'active'
  );
INSERT INTO
  `lab_details` (
    `lab_id`,
    `branch_name`,
    `lab_name`,
    `lab_type`,
    `lab_contact`,
    `lab_email`,
    `address`,
    `status`
  )
VALUES
  (
    3,
    'Madan Mahal',
    'oral',
    'internal',
    '8602161019',
    'testthree@gmail.com',
    'Madan Mahal, Jabalpur',
    'active'
  );
INSERT INTO
  `lab_details` (
    `lab_id`,
    `branch_name`,
    `lab_name`,
    `lab_type`,
    `lab_contact`,
    `lab_email`,
    `address`,
    `status`
  )
VALUES
  (
    10,
    'Vijay Nagar',
    'crash course',
    'internal',
    '1225487465',
    'asdf@gmail.com',
    'garha fatak',
    'approved'
  );
INSERT INTO
  `lab_details` (
    `lab_id`,
    `branch_name`,
    `lab_name`,
    `lab_type`,
    `lab_contact`,
    `lab_email`,
    `address`,
    `status`
  )
VALUES
  (
    11,
    'Madan Mahal',
    'SAAS',
    'internal',
    'SAS',
    'ASAS@GAMAIL',
    'ASASA ',
    'approved'
  );
INSERT INTO
  `lab_details` (
    `lab_id`,
    `branch_name`,
    `lab_name`,
    `lab_type`,
    `lab_contact`,
    `lab_email`,
    `address`,
    `status`
  )
VALUES
  (
    12,
    'New Branch Name',
    'sd',
    'external',
    '4544',
    'devansh@gmail.com',
    'New Address',
    'New Status'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: lab_tests
# ------------------------------------------------------------

INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    1,
    'Language Proficiency Tests',
    '00001',
    '2',
    'oral',
    '2024-05-07',
    2000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    2,
    'Interviews',
    '00002',
    '2',
    'oral',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    3,
    'Oral Presentations',
    '00003',
    '2',
    'oral',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    4,
    'Viva Voce Exams',
    '00004',
    '2',
    'oral',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    5,
    'Language Speaking Exams',
    '00005',
    '2',
    'oral',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    6,
    'Role-Playing Exercises',
    '00006',
    '2',
    'oral',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (7, 'Debates', '00007', '2', 'oral', '0000-00-00', 1000);
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    8,
    'Oral Examinations in Professional Certifications',
    '00008',
    '2',
    'oral',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    9,
    'Complete Blood Count (CBC)',
    '00009',
    '2',
    'blood',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    10,
    'Basic Metabolic Panel (BMP)',
    '00010',
    '2',
    'blood',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    11,
    'Comprehensive Metabolic Panel (CMP)',
    '00011',
    '2',
    'blood',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    12,
    'Lipid Panel',
    '00012',
    '2',
    'blood',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    13,
    'Thyroid Function Tests',
    '00013',
    '2',
    'blood',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    14,
    'Coagulation Tests',
    '00014',
    '2',
    'blood',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    15,
    'Blood Type and Rh Factor',
    '00015',
    '2',
    'blood',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    16,
    'Blood Chemistry Tests',
    '00016',
    '2',
    'blood',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    17,
    'Inflammatory Marker Tests',
    '00017',
    '2',
    'blood',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    18,
    'Viral and Bacterial Infection Tests',
    '00018',
    '2',
    'blood',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    19,
    'X-rays (Radiography)',
    '00019',
    '2',
    'radiology',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    20,
    'Computed Tomography (CT) Scan',
    '00020',
    '2',
    'radiology',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    21,
    'Magnetic Resonance Imaging (MRI)',
    '00021',
    '2',
    'radiology',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    22,
    'Ultrasound',
    '00022',
    '2',
    'radiology',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    23,
    'Fluoroscopy',
    '00023',
    '2',
    'radiology',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    24,
    'Positron Emission Tomography (PET) Scan',
    '00024',
    '2',
    'radiology',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    25,
    'Bone Densitometry (DEXA Scan)',
    '00025',
    '2',
    'radiology',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    26,
    'Mammography',
    '00026',
    '2',
    'radiology',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    27,
    'Nuclear Medicine Imaging',
    '00027',
    '2',
    'radiology',
    '0000-00-00',
    1000
  );
INSERT INTO
  `lab_tests` (
    `lab_tid`,
    `test_name`,
    `test_code`,
    `waiting_days`,
    `default_lab`,
    `test_date`,
    `test_cost`
  )
VALUES
  (
    28,
    'Interventional Radiology Procedures',
    '00028',
    '2',
    'radiology',
    '0000-00-00',
    1000
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: otpcollections
# ------------------------------------------------------------

INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    1,
    'kuldeepdoauruinfosystems@gmail.com',
    162128,
    NULL,
    '2024-03-03 13:23:09.740839'
  );
INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    2,
    'vinaydhariya21@gmail.com',
    698986,
    NULL,
    '2024-03-11 19:13:29.960794'
  );
INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    3,
    'devdeveloper998@gmail.com',
    543331,
    NULL,
    '2024-04-22 18:13:50.621723'
  );
INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    4,
    'anas@gmail.com',
    867224,
    NULL,
    '2024-05-07 17:57:48.138562'
  );
INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    5,
    'umerqureshidoaguru@gmail.com',
    254948,
    NULL,
    '2024-05-07 17:58:04.411082'
  );
INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    6,
    'mi@gmail.com',
    360830,
    NULL,
    '2024-05-08 13:00:07.982180'
  );
INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    7,
    'shadab@gmail.com',
    33403,
    NULL,
    '2024-05-09 18:59:39.017582'
  );
INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    8,
    'mohitsahu1993@gmail.com',
    782012,
    NULL,
    '2024-05-09 18:59:49.910105'
  );
INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    9,
    'kuJABDJAB@gmail.com',
    194147,
    NULL,
    '2024-05-15 16:06:36.851740'
  );
INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    10,
    'kddubey98@gmail.com',
    549336,
    NULL,
    '2024-05-15 16:06:54.984264'
  );
INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    11,
    'kuldeepdoauruinfosystems@gmail.com',
    839263,
    NULL,
    '2024-05-15 16:23:16.509817'
  );
INSERT INTO
  `otpcollections` (`otp_id`, `email`, `code`, `expiresIn`, `createdAt`)
VALUES
  (
    12,
    'kuldeepdoauruinfosystems@gmail.com',
    598196,
    NULL,
    '2024-05-15 19:24:26.315213'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: patient_bills
# ------------------------------------------------------------

INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    1,
    '2024-04-23 15:24:21',
    'dg_1',
    1,
    'Madan Mahal',
    'shubham',
    '8602161019',
    'shubham@gmail.com',
    'shadab',
    9,
    9000,
    'paid',
    '2024-04-03 14:58:22.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    2,
    '2024-04-19 15:13:44',
    'dg_1',
    1,
    'Madan Mahal',
    'shubham',
    '8602161019',
    'shubham@gmail.com',
    'shadab',
    10000,
    10000,
    'paid',
    '2024-04-18 00:00:00.000000',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    3,
    '2024-04-19 20:35:55',
    'dg_1',
    1,
    'Madan Mahal',
    'shubham',
    '8602161019',
    'shubham@gmail.com',
    'shadab',
    100000,
    100000,
    'paid',
    '2024-04-19 00:00:00.000000',
    'vijendra',
    'dg_5',
    'cash',
    NULL,
    '88000 paid',
    5000
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    4,
    '2024-05-02 19:01:15',
    'dg_1',
    1,
    'Madan Mahal',
    'shubham',
    '8602161019',
    'shubham@gmail.com',
    'shadab',
    100000,
    100000,
    'paid',
    '2024-05-02 10:00:00.065000',
    'vijendra',
    'dg_5',
    'cash',
    NULL,
    'ok',
    NULL
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    6,
    '2024-04-25 12:27:43',
    'dg_1',
    30,
    'Madan Mahal',
    'shubham',
    '8602161019',
    'shubham@gmail.com',
    'shadab',
    100000,
    69200,
    'paid',
    '2024-04-20 00:00:00.000000',
    'vijendra',
    'dg_5',
    'cash',
    NULL,
    '62200',
    30800
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    9,
    '2024-04-24 16:59:15',
    '123456',
    24,
    'Madan Mahal',
    'Vinay Johnson',
    '7890123456',
    'alicejohnson@example.com',
    'shadab',
    3270,
    3270,
    'pending',
    '2024-04-24 00:00:00.000000',
    'shadab',
    'dg_4',
    'cash',
    NULL,
    'okkk',
    NULL
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    10,
    '2024-04-24 15:40:49',
    '123456',
    39,
    'Madan Mahal',
    'mohit',
    '2222222223',
    'mohitsahu1993@gmail.com',
    'shadab',
    1578,
    NULL,
    'paid',
    '2024-04-24 00:00:00.000000',
    'shadab',
    NULL,
    'cash',
    NULL,
    NULL,
    1578
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    11,
    '2024-04-24 17:43:53',
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    'shadab',
    0,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    12,
    '2024-04-25 11:51:16',
    '123456',
    42,
    'Madan Mahal',
    'mohit',
    '2222222223',
    'mohitsahu1993@gmail.com',
    'shadab',
    2375,
    -125,
    'paid',
    '2024-04-25 00:00:00.000000',
    'shadab',
    'dg_4',
    'cash',
    NULL,
    'paid',
    2375
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    13,
    '2024-04-25 15:01:26',
    'DH_20',
    57,
    'Madan Mahal',
    'priyanshu',
    '8989865656',
    '',
    'shadab',
    570,
    270,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    300
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    14,
    '2024-05-03 12:50:43',
    'DH_35',
    89,
    'Madan Mahal',
    'nishi',
    '1234567890',
    'nishi@gmail.com',
    'shadab',
    5850,
    4350,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    1500
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    15,
    '2024-05-07 13:12:28',
    'DH_26',
    92,
    'Madan Mahal',
    'nishi',
    '8956496595',
    '',
    'shadab',
    0,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    16,
    '2024-05-08 17:28:14',
    '2',
    95,
    'Madan Mahal',
    'ravi',
    '+918602161010',
    'laxmi@gmail.com',
    'shadab',
    297,
    297,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    17,
    '2024-05-10 15:52:15',
    'DH_15',
    98,
    'Madan Mahal',
    'mohit',
    '9806656568',
    'mohitsahu1993@gmail.com',
    'shadab',
    1470,
    1470,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    18,
    '2024-05-11 13:01:28',
    'DH_39',
    102,
    'Madan Mahal',
    'DEV',
    '1545648676',
    'VINAY211998@GMAIL.COM',
    'shadab',
    0,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    19,
    '2024-05-11 19:19:32',
    'DH_40',
    107,
    'Madan Mahal',
    'UMER',
    '5356132165',
    'vinay21198@gmail.com',
    'shadab',
    600,
    400,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    200
  );
INSERT INTO
  `patient_bills` (
    `bill_id`,
    `bill_date`,
    `uhid`,
    `tp_id`,
    `branch_name`,
    `patient_name`,
    `patient_mobile`,
    `patient_email`,
    `assigned_doctor_name`,
    `total_amount`,
    `paid_amount`,
    `payment_status`,
    `payment_date_time`,
    `receiver_name`,
    `receiver_emp_id`,
    `payment_mode`,
    `transaction_Id`,
    `note`,
    `pay_by_sec_amt`
  )
VALUES
  (
    20,
    '2024-05-11 19:40:59',
    'DH_42',
    108,
    'Madan Mahal',
    'gautam',
    '3247845128',
    'shubhsoni1996th@gmail.com',
    'shadab',
    3000,
    1000,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    2000
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: patient_details
# ------------------------------------------------------------

INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '1',
    'Madan Mahal',
    '',
    'mohit',
    '01-01-1990',
    '',
    '',
    '2',
    '2',
    '0',
    '+918602161019',
    '',
    'mkuldeep313@gmail.com',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '0',
    'Mr shubham singh',
    '',
    'ranu',
    'Damoh',
    '0',
    NULL,
    '0',
    '',
    '',
    '',
    '',
    '2024-03-02 15:15:33',
    '2024-03-02 15:16:18'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '10',
    'Vijay Nagar',
    '',
    '',
    '01-01-1990',
    '',
    '',
    '2',
    '2',
    '0',
    '+918602161015',
    '',
    'abhishek@gmail.com',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '0',
    'Mr nehal Sharma',
    '',
    'nandini',
    'Damoh',
    '0',
    NULL,
    '0',
    '',
    '',
    '',
    '',
    '2024-03-02 15:15:33',
    '2024-03-02 15:16:18'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '11',
    'vijay nagar',
    NULL,
    '',
    '',
    '65',
    '',
    '',
    NULL,
    '',
    '',
    NULL,
    '',
    '',
    '',
    '',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    NULL,
    '',
    NULL,
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-02 20:37:37',
    '2024-03-02 20:37:37'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '12',
    'vijay nagar',
    NULL,
    'ravi',
    '2024-03-02',
    '65',
    '25',
    'Male',
    NULL,
    'B+',
    '9806324244',
    NULL,
    '',
    'Self',
    'Mohit Sahu',
    'no',
    'Asthma',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-02 20:39:35',
    '2024-03-02 20:39:35'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '123456',
    'Madan Mahal',
    NULL,
    'mohit',
    '2024-02-29',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '2222222223',
    NULL,
    'mohitsahu1993@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-04 13:06:32',
    '2024-03-04 13:06:32'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '13',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-03-07',
    '65',
    '25',
    'Male',
    NULL,
    'B+',
    '9806324244',
    NULL,
    '',
    'Self',
    'Mohit Sahu',
    'no',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-02 20:46:29',
    '2024-03-02 20:46:29'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '14',
    'vijay nagar',
    NULL,
    'rohit',
    '2024-02-29',
    '28',
    '65',
    '',
    NULL,
    'B+',
    '9806324244',
    NULL,
    '',
    '',
    '',
    'no',
    'Heart',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    NULL,
    'CGHS(Serving)',
    '54',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-03 14:22:22',
    '2024-03-03 14:22:22'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '15',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-03-15',
    '65',
    '65',
    'Male',
    NULL,
    'B+',
    '9806324284',
    NULL,
    'mohitsahu1993@gmail.com',
    'Self',
    'Mohit Sahu',
    'no',
    'Diabetes,Cardiovascular,Heart',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-03 14:52:10',
    '2024-03-03 14:52:10'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '16',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-03-02',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '8789523658',
    NULL,
    'm@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'Diabetes,Heart',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'CGHS(Serving)',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-03 18:16:29',
    '2024-03-03 18:16:29'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '2',
    'Madan Mahal',
    '',
    'ravi',
    '01-01-1990',
    '34',
    '56',
    'Male',
    '2',
    '0',
    '+918602161010',
    '',
    'laxmi@gmail.com',
    'Self',
    'self',
    '',
    '',
    '',
    '',
    '',
    '',
    '0',
    'Mr mishra',
    'rahul',
    'renuka',
    'Damoh',
    '0',
    'CGHS(Serving)',
    '0',
    '',
    'shadab',
    '',
    'dg_4',
    '2024-03-02 15:15:33',
    '2024-04-24 19:49:47'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '3',
    'Madan Mahal',
    '',
    '',
    '01-01-1990',
    '',
    '',
    '2',
    '2',
    '0',
    '+918602161012',
    '',
    'deepak@gmail.com',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '0',
    'Mr Dinesh Sharma',
    '',
    'Deepti',
    'Damoh',
    '0',
    NULL,
    '0',
    '',
    '',
    '',
    '',
    '2024-03-02 15:15:33',
    '2024-03-02 15:16:18'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '4',
    'Madan Mahal',
    '',
    '',
    '01-01-1990',
    '',
    '',
    '2',
    '2',
    '0',
    '+918602161013',
    '',
    'ritin@gmail.com',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '0',
    'Mr mukesh Sharma',
    '',
    'Durga',
    'Damoh',
    '0',
    NULL,
    '0',
    '',
    '',
    '',
    '',
    '2024-03-02 15:15:33',
    '2024-03-02 15:16:18'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '5',
    'Madan Mahal',
    '',
    '',
    '01-01-1990',
    '',
    '',
    '2',
    '2',
    '0',
    '+918602161013',
    '',
    'sandhya@gmail.com',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '0',
    'Mr ramesh Sharma',
    'manish singh',
    'malti',
    'Damoh',
    '0',
    NULL,
    '0',
    '',
    '',
    '',
    '',
    '2024-03-02 15:15:33',
    '2024-03-02 15:16:18'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '6',
    'Vijay Nagar',
    '',
    '',
    '01-01-1990',
    '',
    '',
    '2',
    '2',
    '0',
    '+918602161013',
    '',
    'roopam@gmail.com',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '0',
    'Mr ram Sharma',
    '',
    'kavita',
    'Damoh',
    '0',
    NULL,
    '0',
    '',
    '',
    '',
    '',
    '2024-03-02 15:15:33',
    '2024-03-02 15:16:18'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '7',
    'Vijay Nagar',
    '',
    '',
    '01-01-1990',
    '',
    '',
    '2',
    '2',
    '0',
    '+918602161013',
    '',
    'vijay@gmail.com',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '0',
    'Mr santosh Sharma',
    '',
    'savitri',
    'Damoh',
    '0',
    NULL,
    '0',
    '',
    '',
    '',
    '',
    '2024-03-02 15:15:33',
    '2024-03-02 15:16:18'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '8',
    'Vijay Nagar',
    '',
    '',
    '01-01-1990',
    '',
    '',
    '2',
    '2',
    '0',
    '+918602161013',
    '',
    'vijay@gmail.com',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '0',
    'Mr vijay Sharma',
    '',
    'sunita',
    'Damoh',
    '0',
    NULL,
    '0',
    '',
    '',
    '',
    '',
    '2024-03-02 15:15:33',
    '2024-03-02 15:16:18'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    '9',
    'Vijay Nagar',
    '',
    '',
    '01-01-1990',
    '',
    '',
    '2',
    '2',
    '0',
    '+918602161014',
    '',
    'shweta@gmail.com',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '0',
    'Mr santosh Sharma',
    '',
    'anuradha',
    'Damoh',
    '0',
    NULL,
    '0',
    '',
    '',
    '',
    '',
    '2024-03-02 15:15:33',
    '2024-03-02 15:16:18'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DG000021',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-03-02',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '5616516589',
    NULL,
    'm@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    '',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'CGHS(Serving)',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-03 18:32:47',
    '2024-03-03 18:32:47'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DG00020',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-03-02',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '5616516584',
    NULL,
    'm@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    '',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'CGHS(Serving)',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-03 18:31:46',
    '2024-03-03 18:31:46'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DG0017',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-03-02',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '8789523659',
    NULL,
    'm@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'Diabetes,Heart',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'CGHS(Serving)',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-03 18:19:54',
    '2024-03-03 18:19:54'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DG0018',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-03-02',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '5616516516',
    NULL,
    'm@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'Diabetes,Heart',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'CGHS(Serving)',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-03 18:21:56',
    '2024-03-03 18:21:56'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DG0019',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-03-02',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '5616516515',
    NULL,
    'm@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'Diabetes,Heart',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'CGHS(Serving)',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-03 18:25:02',
    '2024-03-03 18:25:02'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'dg_1',
    'Madan Mahal',
    NULL,
    'mohit',
    '2018-06-29',
    '5',
    '65',
    'Male',
    NULL,
    'A+',
    '2222222225',
    NULL,
    'mohitsahu1993@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'CGHS(Serving)',
    '655555556656',
    'ravi',
    'shadab',
    '11',
    'dg_4',
    '2024-03-04 13:19:29',
    '2024-04-25 19:42:42'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_10',
    'Madan Mahal',
    NULL,
    'rahul',
    '2024-03-07',
    '48',
    '65',
    'Male',
    NULL,
    'A+',
    '8523698523',
    NULL,
    'mohitsahu1993@gmail.com',
    'Self',
    'self',
    'no',
    'Diabetes,Cardiovascular,other',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-06 12:07:22',
    '2024-03-06 12:07:22'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_11',
    'Madan Mahal',
    NULL,
    'rahul',
    '2024-03-07',
    '48',
    '65',
    'Male',
    NULL,
    'A+',
    '8523698522',
    NULL,
    'mohitsahu1993@gmail.com',
    'Self',
    'self',
    'no',
    'Diabetes,Cardiovascular,other',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-06 12:25:20',
    '2024-03-06 12:25:20'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_12',
    'Madan Mahal',
    NULL,
    'dev',
    '2017-01-25',
    '7',
    '100',
    'Male',
    NULL,
    'A+',
    '1236547890',
    NULL,
    'dev@gmail.com',
    'Self',
    'self',
    'no',
    'Diabetes,Cardiovascular,Arthritis',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'damoh naka',
    NULL,
    'CGHS(Serving)',
    '655555556656',
    'ravi',
    'shadab',
    '11',
    'dg_4',
    '2024-03-06 12:56:10',
    '2024-04-25 19:41:27'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_13',
    'Madan Mahal',
    NULL,
    'vikram',
    '',
    '45',
    '65',
    'Male',
    NULL,
    'A+',
    '7412589636',
    NULL,
    'v@gmail.com',
    'Self',
    'self',
    'no',
    'Heart,Cardiovascular,Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'damoh',
    NULL,
    'CGHS(Serving)',
    '655555556656',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-03-06 18:56:56',
    '2024-03-06 18:56:56'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_14',
    'Madan Mahal',
    NULL,
    'mohit',
    '',
    '25',
    '65',
    'Male',
    NULL,
    'A+',
    '9806656565',
    NULL,
    'mohitsahu1993@gmail.com',
    'Self',
    'Mohit Sahu',
    'no',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-03-06 19:52:17',
    '2024-03-06 19:52:17'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_15',
    'Madan Mahal',
    NULL,
    'mohit',
    '',
    '45',
    '65',
    'Male',
    NULL,
    'A+',
    '9806656568',
    NULL,
    'mohitsahu1993@gmail.com',
    'Self',
    'Mohit Sahu',
    'no',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-03-06 20:05:01',
    '2024-03-06 20:05:01'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_16',
    'Madan Mahal',
    NULL,
    'vikram',
    '2024-03-07',
    '15',
    '65',
    'Male',
    NULL,
    'A+',
    '8989898989',
    NULL,
    'mohitsahu1993@gmail.com',
    'Self',
    'Mohit Sahu',
    'no',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-03-07 12:55:00',
    '2024-03-07 12:55:00'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_17',
    'Madan Mahal',
    NULL,
    'adi sen',
    '2024-03-08',
    '25',
    '65',
    'Male',
    NULL,
    'A+',
    '9806324244',
    NULL,
    'mohitsahu1993@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'CGHS(Pensioner)',
    '655555556656',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-03-07 17:24:42',
    '2024-03-07 17:24:42'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_18',
    'Madan Mahal',
    NULL,
    'adi aaa',
    '2024-03-08',
    '-1',
    '65',
    'Male',
    NULL,
    'A+',
    '9806324244',
    NULL,
    'mohitsahu1993@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'CGHS(Pensioner)',
    '655555556656',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-03-07 17:33:32',
    '2024-03-07 17:33:32'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_19',
    'Madan Mahal',
    NULL,
    'dev',
    '2020-02-07',
    '4',
    '45',
    'Male',
    NULL,
    'A+',
    '1232254855',
    NULL,
    'devdeveloper998@gmail.com',
    'Other',
    'Mohit Sahu',
    'no',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'fdgdsd',
    NULL,
    'Genral',
    'sdfsdf',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-03-07 20:00:40',
    '2024-03-07 20:00:40'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_2',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-02-29',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '2222222220',
    NULL,
    'mohitsahu1993@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-04 13:20:15',
    '2024-03-04 13:20:15'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_20',
    'Madan Mahal',
    NULL,
    'priyanshu',
    '',
    '45',
    '60',
    'Male',
    NULL,
    'A+',
    '8989865656',
    NULL,
    '',
    'Self',
    'self',
    'no',
    'Diabetes,Heart',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'some',
    NULL,
    'General',
    '',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-24 16:03:50',
    '2024-04-24 16:03:50'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_21',
    'Madan Mahal',
    NULL,
    'soni ji',
    '2024-04-01',
    '26',
    '80kg',
    'Male',
    NULL,
    'B+',
    '2154879231',
    NULL,
    'soni@gmail.com',
    'Father',
    'sdfedf',
    'yes',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'wright town',
    NULL,
    'General',
    '124521451452',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-24 18:05:16',
    '2024-04-24 18:05:16'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_22',
    'Madan Mahal',
    NULL,
    'vinay',
    '',
    'ssffc',
    'xvfgf',
    'Male',
    NULL,
    'A+',
    'qweefefefe',
    NULL,
    'vinaydhariya21@gmail.com',
    'Father',
    '898',
    '',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'ranital',
    NULL,
    'General',
    'qwedxdwwwerw',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-24 18:26:59',
    '2024-04-24 18:26:59'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_23',
    'Madan Mahal',
    NULL,
    'yadav ji',
    '',
    '25',
    '56',
    'Male',
    NULL,
    'A+',
    '8989898989',
    NULL,
    '',
    'Self',
    'self',
    '',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'jbp',
    NULL,
    'CGHS(Serving)',
    '',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-24 20:01:43',
    '2024-04-24 20:01:43'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_24',
    'Madan Mahal',
    NULL,
    'vinay',
    '2024-04-25',
    '26',
    '75',
    'Male',
    NULL,
    'AB+',
    '9198900449',
    NULL,
    'vinaydhariya21@gmail.com',
    'Self',
    'vinay',
    'yes',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'gupta colony',
    NULL,
    'CGHS(Serving)',
    '214784967264',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-25 11:11:50',
    '2024-04-25 11:11:50'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_25',
    'Madan Mahal',
    NULL,
    'shiv singh',
    '2002-08-11',
    '21',
    '70kg',
    'Male',
    NULL,
    'O+',
    '9993641663',
    NULL,
    'shiv@gmail.com',
    'Other',
    'None',
    'No',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'Ranital Jabalpur',
    NULL,
    'General',
    '777788889999',
    'shadab',
    'shadab',
    'dg_4',
    'dg_4',
    '2024-04-25 11:41:50',
    '2024-04-25 12:25:56'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_26',
    'Madan Mahal',
    NULL,
    'nishi',
    '2024-04-25',
    '25',
    '65',
    'Male',
    NULL,
    'A+',
    '8956496595',
    NULL,
    '',
    'Self',
    'self',
    '',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'jabalpur',
    NULL,
    'General',
    '',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-25 16:09:25',
    '2024-04-25 16:09:25'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_27',
    'Madan Mahal',
    NULL,
    'vinay2',
    '2024-04-26',
    '26',
    '75',
    'Male',
    NULL,
    'AB+',
    '9198900449',
    NULL,
    'vinaydhariya21@gmail.com',
    'Self',
    'vinay',
    'yes',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'gupta colony',
    NULL,
    'General',
    '124521451452',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-26 14:05:54',
    '2024-04-26 14:05:54'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_28',
    'Madan Mahal',
    NULL,
    'khan shahab',
    '2020-02-27',
    '4',
    '30',
    'Male',
    NULL,
    'A+',
    '5656656565',
    NULL,
    'khansahab@gmail.com',
    'Other',
    'other',
    'dhoop se allergy',
    'Diabetes,Cardiovascular,Arthritis',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'laptaganj',
    NULL,
    'CGHS(Serving)',
    '',
    'shadab',
    'shadab',
    'dg_4',
    'dg_4',
    '2024-04-27 17:41:24',
    '2024-04-27 18:31:40'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_29',
    'Madan Mahal',
    NULL,
    'dubey ji',
    '2024-04-27',
    '65',
    '60',
    'Male',
    NULL,
    'A+',
    '8989898989',
    NULL,
    'd@gmail.com',
    'Self',
    'self',
    'no',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'gali no 420 sadar',
    NULL,
    'CGHS(Serving)',
    '',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-27 17:44:50',
    '2024-04-27 17:44:50'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_3',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-02-29',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '5656565656',
    NULL,
    'mohitsahu1993@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-04 13:21:10',
    '2024-03-04 13:21:10'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_30',
    'Madan Mahal',
    NULL,
    'umer first',
    '',
    '56',
    '65',
    'Male',
    NULL,
    'B+',
    '8989896656',
    NULL,
    'u@gmal.com',
    'Self',
    'self',
    'dhoop se allergy',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'jbp',
    NULL,
    'General',
    '',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-27 19:34:24',
    '2024-04-27 19:34:24'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_31',
    'Madan Mahal',
    NULL,
    'umer second',
    '',
    '25',
    '65',
    'Male',
    NULL,
    'B+',
    '8965734659',
    NULL,
    '',
    'Other',
    'other',
    'dhoop se allergy',
    'Diabetes,Cardiovascular',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'JABALPUR',
    NULL,
    'CGHS(Serving)',
    '',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-27 19:36:06',
    '2024-04-27 19:36:06'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_32',
    'Madan Mahal',
    NULL,
    'dhariya',
    '2024-04-16',
    '26',
    '75',
    'Male',
    NULL,
    'A+',
    '8989894562',
    NULL,
    'vinaydhariya21@gmail.com',
    'Self',
    'vinay',
    'yes',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'gupta colony',
    NULL,
    'General',
    '124521451452',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-29 10:49:26',
    '2024-04-29 10:49:26'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_33',
    'Madan Mahal',
    NULL,
    '123',
    '2024-04-08',
    'four',
    'seven',
    'Male',
    NULL,
    'A+',
    'dsdfsfddgg',
    NULL,
    'vinaydhariya21@gmail.com',
    'Self',
    '1234',
    '132',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'gupta colony',
    NULL,
    'General',
    'qwedxdwwwerw',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-04-29 14:36:49',
    '2024-04-29 14:36:49'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_34',
    'Madan Mahal',
    NULL,
    'subham2',
    '1998-04-01',
    '26',
    '75',
    'Male',
    NULL,
    'O+',
    '8989894562',
    NULL,
    'xqwsfeqfe@gmail.com',
    'Self',
    'vinay',
    'no',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'gupta colony',
    NULL,
    'General',
    '124521451452',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-05-02 15:34:54',
    '2024-05-02 15:34:54'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_35',
    'Madan Mahal',
    NULL,
    'nishi',
    '1998-04-03',
    '26',
    '78',
    'Male',
    NULL,
    'B+',
    '1234567890',
    NULL,
    'nishi@gmail.com',
    'Self',
    'vinay',
    'yes',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'napier town',
    NULL,
    'General',
    '123456789123',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-05-03 12:23:29',
    '2024-05-03 12:23:29'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_36',
    'Madan Mahal',
    NULL,
    'yogendra',
    '2016-02-11',
    '8',
    '40',
    'Male',
    NULL,
    'A+',
    '8989896969',
    NULL,
    'yogendra@gmail.com',
    'Self',
    'None',
    'No',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'green city',
    NULL,
    'General',
    '444444444444',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-05-06 12:22:38',
    '2024-05-06 12:22:38'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_37',
    'Madan Mahal',
    NULL,
    'vinaydhariya',
    '1998-04-21',
    '26',
    '70',
    'Male',
    NULL,
    'A+',
    '9198900449',
    NULL,
    'vinay211998@gmail.com',
    'Self',
    'vinay',
    'yes',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'gupta colony',
    NULL,
    'General',
    '123456987456',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-05-10 17:01:26',
    '2024-05-10 17:01:26'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_38',
    'Madan Mahal',
    NULL,
    'subham soni',
    '4321-05-21',
    '-2298',
    '75',
    'Female',
    NULL,
    'A+',
    '1456214567',
    NULL,
    'shubhsoni1996th@gmail.com',
    'Self',
    'sdjgd',
    'yes',
    'Heart',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'kjgsdyhwgd',
    NULL,
    'General',
    '446231575321',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-05-11 12:37:42',
    '2024-05-11 12:37:42'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_39',
    'Madan Mahal',
    NULL,
    'DEV',
    '2024-05-02',
    'SSW',
    '5',
    'Male',
    NULL,
    'A+',
    '1545648676',
    NULL,
    'VINAY211998@GMAIL.COM',
    'Self',
    'NBHJ',
    'yes',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'HJGHG',
    NULL,
    'General',
    '124651657894',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-05-11 12:49:21',
    '2024-05-11 12:49:21'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_4',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-02-29',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '7855465654',
    NULL,
    'mohitsahu1993@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-04 13:33:53',
    '2024-03-04 13:33:53'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_40',
    'Madan Mahal',
    NULL,
    'UMER',
    '2024-05-01',
    'CE',
    '80kg',
    'Male',
    NULL,
    'A+',
    '5356132165',
    NULL,
    'vinay21198@gmail.com',
    'Self',
    'vinay',
    'yes',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '321345',
    NULL,
    'General',
    '332465413216',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-05-11 13:25:28',
    '2024-05-11 13:25:28'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_41',
    'Madan Mahal',
    NULL,
    'mohit ',
    '2024-05-01',
    'sdsw',
    '80kg',
    'Male',
    NULL,
    'A+',
    '2165486432',
    NULL,
    'vinaydhariya21@gmail.com',
    'Self',
    'vinay',
    'yes',
    'Heart',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '4',
    NULL,
    'General',
    '874653124846',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-05-11 15:39:00',
    '2024-05-11 15:39:00'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_42',
    'Madan Mahal',
    NULL,
    'gautam',
    '2024-05-01',
    'sdfs',
    'sdfs',
    'Male',
    NULL,
    'A+',
    '3247845128',
    NULL,
    'shubhsoni1996th@gmail.com',
    'Self',
    'vinay',
    'ed',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2874512',
    NULL,
    'General',
    '124521451452',
    'shadab',
    NULL,
    'dg_4',
    NULL,
    '2024-05-11 19:30:49',
    '2024-05-11 19:30:49'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_5',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-02-29',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '7855465657',
    NULL,
    'mohitsahu1993@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-04 14:38:12',
    '2024-03-04 14:38:12'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_6',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-02-29',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '7855465653',
    NULL,
    'mohitsahu1993@gmail.com',
    'Father',
    'Mohit Sahu',
    'no',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-04 14:38:40',
    '2024-03-04 14:38:40'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_7',
    'vijay nagar',
    NULL,
    'mohit',
    '2024-03-05',
    '65',
    '65',
    'Male',
    NULL,
    'A+',
    '9898989898',
    NULL,
    'mohitsahu1993@gmail.com',
    'Self',
    'Mohit Sahu',
    'no',
    'Diabetes',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-04 17:44:51',
    '2024-03-04 17:44:51'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_8',
    'vijay nagar',
    NULL,
    'ravi',
    '2024-03-06',
    '56',
    '78',
    'Male',
    NULL,
    'A+',
    '2323232323',
    NULL,
    'mohitsahu1993@gmail.com',
    'Self',
    'self',
    'no',
    'Diabetes,Heart',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'CGHS(Serving)',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-04 19:46:14',
    '2024-03-04 19:46:14'
  );
INSERT INTO
  `patient_details` (
    `uhid`,
    `branch_name`,
    `initialid`,
    `patient_name`,
    `dob`,
    `age`,
    `weight`,
    `gender`,
    `maritalstatus`,
    `bloodgroup`,
    `mobileno`,
    `alternatecontactno`,
    `emailid`,
    `contact_person`,
    `contact_person_name`,
    `allergy`,
    `disease`,
    `isstaff`,
    `staffempid`,
    `staffrelationid`,
    `isforeign`,
    `isvip`,
    `fathername`,
    `husbandname`,
    `mothername`,
    `address`,
    `pincode`,
    `patient_type`,
    `aadhaar_no`,
    `patient_added_by`,
    `patient_updated_by`,
    `patient_added_by_emp_id`,
    `patient_updated_by_emp_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'DH_9',
    'Madan Mahal',
    NULL,
    'rahul',
    '2024-03-06',
    '2',
    '65',
    'Male',
    NULL,
    'A+',
    '9632587412',
    NULL,
    'mohitsahu1993@gmail.com',
    'Self',
    'Mohit Sahu',
    'no',
    'No Disease',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'H n 609 Sahu pan bhandar',
    NULL,
    'Genral',
    '655555556656',
    'ravi',
    NULL,
    '11',
    NULL,
    '2024-03-05 12:26:34',
    '2024-03-05 12:26:34'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: patient_disease
# ------------------------------------------------------------

INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (1, 'No Disease', 'No Disease');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (2, 'Diabetes', 'Diabetes');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (3, 'Heart', 'Heart');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (4, 'Cardiovascular', 'Cardiovascular');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (5, 'Asthma', 'Asthma');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (6, 'Arthritis', 'Arthritis');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (7, 'Osteoporosis', 'Osteoporosis');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (8, 'Thyroid', 'Thyroid');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (9, 'Kidney', 'Kidney');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (10, 'Liver', 'Liver');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (11, 'Gastrointestinal', 'Gastrointestinal');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (12, 'Cancer', 'Cancer');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (13, 'Depression', 'Depression');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (14, 'Anxiety', 'Anxiety');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (15, 'Alzheimer\'s', 'Alzheimer\'s');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (16, 'HIV', 'HIV');
INSERT INTO
  `patient_disease` (`id`, `value`, `label`)
VALUES
  (17, 'Hepatitis', 'Hepatitis');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: patient_lab_details
# ------------------------------------------------------------

INSERT INTO
  `patient_lab_details` (
    `testid`,
    `tpid`,
    `patient_uhid`,
    `patient_name`,
    `branch_name`,
    `assigned_doctor_name`,
    `lab_name`,
    `test`,
    `test_status`,
    `created_date`
  )
VALUES
  (
    22,
    96,
    'DH_25',
    'shiv singh',
    'Madan Mahal',
    'shadab',
    'pathology',
    'Thyroid Function Tests',
    'pending',
    '2024-05-22 18:13:38'
  );
INSERT INTO
  `patient_lab_details` (
    `testid`,
    `tpid`,
    `patient_uhid`,
    `patient_name`,
    `branch_name`,
    `assigned_doctor_name`,
    `lab_name`,
    `test`,
    `test_status`,
    `created_date`
  )
VALUES
  (
    23,
    96,
    'DH_25',
    'shiv singh',
    'Madan Mahal',
    'shadab',
    'oral',
    'Viva Voce Exams',
    'pending',
    '2024-05-10 15:41:44'
  );
INSERT INTO
  `patient_lab_details` (
    `testid`,
    `tpid`,
    `patient_uhid`,
    `patient_name`,
    `branch_name`,
    `assigned_doctor_name`,
    `lab_name`,
    `test`,
    `test_status`,
    `created_date`
  )
VALUES
  (
    24,
    97,
    'DH_15',
    'mohit',
    'Madan Mahal',
    'shadab',
    'blood',
    'Thyroid Function Tests',
    'pending',
    '2024-05-10 15:47:49'
  );
INSERT INTO
  `patient_lab_details` (
    `testid`,
    `tpid`,
    `patient_uhid`,
    `patient_name`,
    `branch_name`,
    `assigned_doctor_name`,
    `lab_name`,
    `test`,
    `test_status`,
    `created_date`
  )
VALUES
  (
    26,
    97,
    'DH_15',
    'mohit',
    'Madan Mahal',
    'shadab',
    'oral',
    'Role-Playing Exercises',
    'done',
    '2024-05-13 12:53:08'
  );
INSERT INTO
  `patient_lab_details` (
    `testid`,
    `tpid`,
    `patient_uhid`,
    `patient_name`,
    `branch_name`,
    `assigned_doctor_name`,
    `lab_name`,
    `test`,
    `test_status`,
    `created_date`
  )
VALUES
  (
    27,
    99,
    'DH_15',
    'mohit',
    'Madan Mahal',
    'shadab',
    'blood',
    'Comprehensive Metabolic Panel (CMP)',
    'done',
    '2024-05-11 17:16:32'
  );
INSERT INTO
  `patient_lab_details` (
    `testid`,
    `tpid`,
    `patient_uhid`,
    `patient_name`,
    `branch_name`,
    `assigned_doctor_name`,
    `lab_name`,
    `test`,
    `test_status`,
    `created_date`
  )
VALUES
  (
    29,
    101,
    'DH_38',
    'subham soni',
    'Madan Mahal',
    'shadab',
    'radiology',
    '',
    'pending',
    '2024-05-11 12:49:04'
  );
INSERT INTO
  `patient_lab_details` (
    `testid`,
    `tpid`,
    `patient_uhid`,
    `patient_name`,
    `branch_name`,
    `assigned_doctor_name`,
    `lab_name`,
    `test`,
    `test_status`,
    `created_date`
  )
VALUES
  (
    30,
    101,
    'DH_38',
    'subham soni',
    'Madan Mahal',
    'shadab',
    '',
    '',
    'pending',
    '2024-05-11 12:49:12'
  );
INSERT INTO
  `patient_lab_details` (
    `testid`,
    `tpid`,
    `patient_uhid`,
    `patient_name`,
    `branch_name`,
    `assigned_doctor_name`,
    `lab_name`,
    `test`,
    `test_status`,
    `created_date`
  )
VALUES
  (
    35,
    111,
    'DH_37',
    'vinaydhariya',
    'Madan Mahal',
    'shadab',
    'blood',
    '',
    'pending',
    '2024-05-13 14:47:47'
  );
INSERT INTO
  `patient_lab_details` (
    `testid`,
    `tpid`,
    `patient_uhid`,
    `patient_name`,
    `branch_name`,
    `assigned_doctor_name`,
    `lab_name`,
    `test`,
    `test_status`,
    `created_date`
  )
VALUES
  (
    36,
    112,
    'DH_37',
    'vinaydhariya',
    'Madan Mahal',
    'shadab',
    'blood',
    '',
    'pending',
    '2024-05-13 16:04:26'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: patient_lab_test_details
# ------------------------------------------------------------

INSERT INTO
  `patient_lab_test_details` (
    `id`,
    `testid`,
    `patient_uhid`,
    `patient_name`,
    `test`,
    `result`,
    `unit`,
    `cost`,
    `collection_date`,
    `authenticate_date`,
    `payment`,
    `payment_status`,
    `lab_type`,
    `created_date`
  )
VALUES
  (
    37,
    27,
    'DH_15',
    'mohit',
    'Comprehensive Metabolic Panel (CMP)',
    '50',
    '40',
    '1000',
    '2024-05-14',
    '2024-05-07',
    1000,
    'done',
    NULL,
    '2024-05-11 17:18:27'
  );
INSERT INTO
  `patient_lab_test_details` (
    `id`,
    `testid`,
    `patient_uhid`,
    `patient_name`,
    `test`,
    `result`,
    `unit`,
    `cost`,
    `collection_date`,
    `authenticate_date`,
    `payment`,
    `payment_status`,
    `lab_type`,
    `created_date`
  )
VALUES
  (
    40,
    26,
    'DH_15',
    'mohit',
    'Role-Playing Exercises',
    'dgre',
    'dffhrtghj',
    '1000',
    '2024-05-11',
    '2024-05-12',
    1000,
    'done',
    NULL,
    '2024-05-13 12:53:26'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: patient_test_notes
# ------------------------------------------------------------

INSERT INTO
  `patient_test_notes` (`id`, `note_text`, `testid`)
VALUES
  (11, 'Updated note text 2', 5);
INSERT INTO
  `patient_test_notes` (`id`, `note_text`, `testid`)
VALUES
  (14, 'Updated note text 3', 5);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: patient_timeline
# ------------------------------------------------------------

INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1,
    '2024-03-31 21:30:00',
    '16:33:14.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    2,
    '2024-03-31 21:30:00',
    '17:16:17.000000',
    'Examiantion',
    'Add Teeth',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    3,
    '2024-03-31 21:30:00',
    '17:33:08.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    4,
    '2024-03-31 21:30:00',
    '18:19:48.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    5,
    '2024-03-31 21:30:00',
    '19:07:24.000000',
    'Treatment Suggest',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    6,
    '2024-03-31 21:30:00',
    '19:07:38.000000',
    ' Dental Laboratory Test',
    'Add Laboratory Test',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    7,
    '2024-03-31 21:30:00',
    '19:31:11.000000',
    'Secuirty Amount',
    'Select Treatment Plan',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    8,
    '2024-03-31 21:30:00',
    '19:32:33.000000',
    'Secuirty Amount',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    9,
    '2024-03-31 21:30:00',
    '20:11:47.000000',
    'Treatment Form',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    10,
    '2024-04-01 21:30:00',
    '10:39:03.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    11,
    '2024-04-01 21:30:00',
    '12:03:53.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    12,
    '2024-04-01 21:30:00',
    '12:04:50.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    13,
    '2024-04-01 21:30:00',
    '12:05:40.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    14,
    '2024-04-01 21:30:00',
    '12:06:05.000000',
    'Treatment Producer',
    'Treatment Data Update',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    15,
    '2024-04-01 21:30:00',
    '12:21:01.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    16,
    '2024-04-01 21:30:00',
    '12:21:06.000000',
    'Treatment Producer',
    'Treatment Data Delete ',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    17,
    '2024-04-01 21:30:00',
    '12:33:39.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    18,
    '2024-04-01 21:30:00',
    '12:35:02.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    19,
    '2024-04-01 21:30:00',
    '12:37:21.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    20,
    '2024-04-01 21:30:00',
    '12:37:25.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    21,
    '2024-04-01 21:30:00',
    '12:55:22.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    22,
    '2024-04-01 21:30:00',
    '12:58:24.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    23,
    '2024-04-01 21:30:00',
    '12:59:09.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    24,
    '2024-04-01 21:30:00',
    '13:00:23.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    25,
    '2024-04-01 21:30:00',
    '13:40:35.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    26,
    '2024-04-01 21:30:00',
    '14:44:33.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    27,
    '2024-04-01 21:30:00',
    '19:45:46.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    28,
    '2024-04-01 21:30:00',
    '20:04:54.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    29,
    '2024-04-01 21:30:00',
    '20:08:24.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    30,
    '2024-04-01 21:30:00',
    '20:12:33.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    31,
    '2024-04-01 21:30:00',
    '20:17:12.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    32,
    '2024-04-01 21:30:00',
    '20:41:43.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    33,
    '2024-04-02 21:30:00',
    '10:21:41.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    34,
    '2024-04-02 21:30:00',
    '10:27:28.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    35,
    '2024-04-02 21:30:00',
    '10:28:27.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    36,
    '2024-04-02 21:30:00',
    '10:28:53.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    37,
    '2024-04-02 21:30:00',
    '13:02:08.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    38,
    '2024-04-02 21:30:00',
    '13:06:11.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    39,
    '2024-04-02 21:30:00',
    '13:08:22.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    40,
    '2024-04-02 21:30:00',
    '13:11:18.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    41,
    '2024-04-02 21:30:00',
    '13:11:37.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    42,
    '2024-04-02 21:30:00',
    '13:12:01.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    43,
    '2024-04-02 21:30:00',
    '13:12:08.000000',
    'Treatment Producer',
    'Treatment Data Delete ',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    44,
    '2024-04-02 21:30:00',
    '13:12:43.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    45,
    '2024-04-02 21:30:00',
    '13:13:01.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    46,
    '2024-04-02 21:30:00',
    '13:13:24.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    47,
    '2024-04-02 21:30:00',
    '13:13:33.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    48,
    '2024-04-02 21:30:00',
    '13:14:26.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    49,
    '2024-04-02 21:30:00',
    '13:14:56.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    50,
    '2024-04-02 21:30:00',
    '13:15:02.000000',
    ' Dental Laboratory Test',
    'Add Laboratory Test',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    51,
    '2024-04-02 21:30:00',
    '13:15:18.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    52,
    '2024-04-02 21:30:00',
    '13:17:00.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    53,
    '2024-04-02 21:30:00',
    '13:17:13.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    54,
    '2024-04-02 21:30:00',
    '13:17:33.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    55,
    '2024-04-02 21:30:00',
    '13:17:39.000000',
    ' Dental Laboratory Test',
    'Add Laboratory Test',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    56,
    '2024-04-02 21:30:00',
    '13:20:26.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    57,
    '2024-04-02 21:30:00',
    '13:20:41.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    58,
    '2024-04-02 21:30:00',
    '14:35:35.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    59,
    '2024-04-02 21:30:00',
    '14:41:17.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    60,
    '2024-04-02 21:30:00',
    '14:43:49.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    61,
    '2024-04-02 21:30:00',
    '14:44:00.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    62,
    '2024-04-02 21:30:00',
    '15:32:39.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    63,
    '2024-04-02 21:30:00',
    '15:45:16.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    64,
    '2024-04-02 21:30:00',
    '15:45:45.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    65,
    '2024-04-02 21:30:00',
    '17:03:41.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    66,
    '2024-04-02 21:30:00',
    '17:03:56.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    67,
    '2024-04-02 21:30:00',
    '17:04:37.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    68,
    '2024-04-02 21:30:00',
    '17:05:45.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    69,
    '2024-04-02 21:30:00',
    '17:11:38.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    70,
    '2024-04-02 21:30:00',
    '17:11:49.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    71,
    '2024-04-02 21:30:00',
    '17:11:56.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    72,
    '2024-04-02 21:30:00',
    '17:52:19.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    73,
    '2024-04-02 21:30:00',
    '20:23:26.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    74,
    '2024-04-03 21:30:00',
    '10:22:23.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    75,
    '2024-04-03 21:30:00',
    '10:33:08.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    76,
    '2024-04-03 21:30:00',
    '10:33:29.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    77,
    '2024-04-03 21:30:00',
    '10:35:20.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    78,
    '2024-04-03 21:30:00',
    '10:36:48.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    79,
    '2024-04-03 21:30:00',
    '10:38:01.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    80,
    '2024-04-03 21:30:00',
    '10:39:19.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    81,
    '2024-04-03 21:30:00',
    '10:39:58.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    82,
    '2024-04-03 21:30:00',
    '10:40:41.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    83,
    '2024-04-03 21:30:00',
    '10:41:50.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    84,
    '2024-04-03 21:30:00',
    '10:42:04.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    85,
    '2024-04-03 21:30:00',
    '10:43:15.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    86,
    '2024-04-03 21:30:00',
    '10:45:08.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    87,
    '2024-04-03 21:30:00',
    '10:45:28.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    88,
    '2024-04-03 21:30:00',
    '10:46:15.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    89,
    '2024-04-03 21:30:00',
    '10:47:38.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    90,
    '2024-04-03 21:30:00',
    '10:48:30.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    91,
    '2024-04-03 21:30:00',
    '10:57:15.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    92,
    '2024-04-03 21:30:00',
    '11:09:05.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    93,
    '2024-04-03 21:30:00',
    '11:10:08.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    94,
    '2024-04-03 21:30:00',
    '11:10:16.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    95,
    '2024-04-03 21:30:00',
    '11:11:05.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    96,
    '2024-04-03 21:30:00',
    '11:28:06.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    97,
    '2024-04-03 21:30:00',
    '11:32:49.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    98,
    '2024-04-03 21:30:00',
    '15:27:01.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    99,
    '2024-04-03 21:30:00',
    '15:56:53.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    100,
    '2024-04-03 21:30:00',
    '16:05:10.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    101,
    '2024-04-03 21:30:00',
    '16:07:21.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    102,
    '2024-04-03 21:30:00',
    '16:08:24.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    103,
    '2024-04-03 21:30:00',
    '18:53:48.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    104,
    '2024-04-03 21:30:00',
    '18:54:40.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    105,
    '2024-04-03 21:30:00',
    '20:42:35.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    106,
    '2024-04-03 21:30:00',
    '20:51:47.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    107,
    '2024-04-03 21:30:00',
    '21:54:56.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    108,
    '2024-04-04 21:30:00',
    '10:18:41.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    109,
    '2024-04-04 21:30:00',
    '11:06:14.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    110,
    '2024-04-04 21:30:00',
    '11:07:46.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    111,
    '2024-04-04 21:30:00',
    '11:08:24.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    112,
    '2024-04-04 21:30:00',
    '11:22:07.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    113,
    '2024-04-04 21:30:00',
    '11:23:14.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    114,
    '2024-04-04 21:30:00',
    '11:25:49.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    115,
    '2024-04-04 21:30:00',
    '11:28:24.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    116,
    '2024-04-04 21:30:00',
    '11:35:16.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    117,
    '2024-04-04 21:30:00',
    '11:37:06.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    118,
    '2024-04-04 21:30:00',
    '11:37:15.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    119,
    '2024-04-04 21:30:00',
    '11:39:58.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    120,
    '2024-04-04 21:30:00',
    '11:40:39.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    121,
    '2024-04-04 21:30:00',
    '11:42:22.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    122,
    '2024-04-04 21:30:00',
    '11:42:48.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    123,
    '2024-04-04 21:30:00',
    '13:39:05.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    124,
    '2024-04-04 21:30:00',
    '13:39:51.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    125,
    '2024-04-04 21:30:00',
    '13:43:52.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    126,
    '2024-04-04 21:30:00',
    '13:45:14.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    127,
    '2024-04-04 21:30:00',
    '13:47:05.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    128,
    '2024-04-04 21:30:00',
    '13:48:06.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    129,
    '2024-04-04 21:30:00',
    '13:50:45.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    130,
    '2024-04-04 21:30:00',
    '13:52:42.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    131,
    '2024-04-04 21:30:00',
    '14:04:23.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    132,
    '2024-04-04 21:30:00',
    '14:14:51.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    133,
    '2024-04-04 21:30:00',
    '14:16:32.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    134,
    '2024-04-04 21:30:00',
    '14:32:09.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    135,
    '2024-04-04 21:30:00',
    '14:33:46.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    136,
    '2024-04-04 21:30:00',
    '14:34:33.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    137,
    '2024-04-04 21:30:00',
    '14:44:46.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    138,
    '2024-04-04 21:30:00',
    '14:45:45.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    139,
    '2024-04-04 21:30:00',
    '15:56:21.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    140,
    '2024-04-04 21:30:00',
    '16:38:15.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    141,
    '2024-04-04 21:30:00',
    '16:41:20.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    142,
    '2024-04-04 21:30:00',
    '16:43:13.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    143,
    '2024-04-04 21:30:00',
    '16:43:59.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    144,
    '2024-04-05 21:30:00',
    '10:31:11.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    145,
    '2024-04-05 21:30:00',
    '10:39:35.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    146,
    '2024-04-05 21:30:00',
    '10:43:05.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    147,
    '2024-04-05 21:30:00',
    '10:46:13.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    148,
    '2024-04-05 21:30:00',
    '15:34:42.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    149,
    '2024-04-05 21:30:00',
    '15:35:04.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    150,
    '2024-04-05 21:30:00',
    '16:52:04.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    151,
    '2024-04-05 21:30:00',
    '17:03:15.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    152,
    '2024-04-05 21:30:00',
    '17:04:36.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    153,
    '2024-04-05 21:30:00',
    '17:10:11.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    154,
    '2024-04-05 21:30:00',
    '17:10:36.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    155,
    '2024-04-05 21:30:00',
    '17:17:57.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    156,
    '2024-04-05 21:30:00',
    '17:51:19.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    157,
    '2024-04-05 21:30:00',
    '17:51:33.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    158,
    '2024-04-05 21:30:00',
    '21:05:43.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    159,
    '2024-04-05 21:30:00',
    '21:10:31.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    160,
    '2024-04-05 21:30:00',
    '21:18:59.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    161,
    '2024-04-05 21:30:00',
    '21:26:12.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    162,
    '2024-04-05 21:30:00',
    '21:27:10.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    163,
    '2024-04-05 21:30:00',
    '21:27:55.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    164,
    '2024-04-05 21:30:00',
    '21:39:42.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    165,
    '2024-04-05 21:30:00',
    '21:42:10.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    166,
    '2024-04-05 21:30:00',
    '21:43:03.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    167,
    '2024-04-05 21:30:00',
    '22:03:37.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    168,
    '2024-04-05 21:30:00',
    '22:10:29.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    169,
    '2024-04-07 21:30:00',
    '10:44:13.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    170,
    '2024-04-07 21:30:00',
    '10:44:33.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    171,
    '2024-04-07 21:30:00',
    '10:45:15.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    172,
    '2024-04-07 21:30:00',
    '10:45:52.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    173,
    '2024-04-07 21:30:00',
    '10:46:43.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    174,
    '2024-04-07 21:30:00',
    '11:24:56.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    175,
    '2024-04-07 21:30:00',
    '11:26:02.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    176,
    '2024-04-07 21:30:00',
    '11:45:23.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    177,
    '2024-04-07 21:30:00',
    '11:56:24.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    178,
    '2024-04-07 21:30:00',
    '12:39:58.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    179,
    '2024-04-07 21:30:00',
    '12:41:22.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    180,
    '2024-04-07 21:30:00',
    '12:42:17.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    181,
    '2024-04-07 21:30:00',
    '12:44:36.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    182,
    '2024-04-07 21:30:00',
    '12:49:43.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    183,
    '2024-04-07 21:30:00',
    '12:51:24.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    184,
    '2024-04-07 21:30:00',
    '12:53:45.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    185,
    '2024-04-07 21:30:00',
    '15:24:41.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    186,
    '2024-04-07 21:30:00',
    '15:31:47.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    187,
    '2024-04-07 21:30:00',
    '15:33:35.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    188,
    '2024-04-07 21:30:00',
    '15:50:42.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    189,
    '2024-04-07 21:30:00',
    '16:12:36.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    190,
    '2024-04-07 21:30:00',
    '16:14:26.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    191,
    '2024-04-07 21:30:00',
    '16:15:16.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    192,
    '2024-04-07 21:30:00',
    '16:34:52.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    193,
    '2024-04-07 21:30:00',
    '16:39:32.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    194,
    '2024-04-07 21:30:00',
    '17:44:14.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    195,
    '2024-04-07 21:30:00',
    '17:45:13.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    196,
    '2024-04-07 21:30:00',
    '17:45:20.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    197,
    '2024-04-07 21:30:00',
    '17:48:09.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    198,
    '2024-04-07 21:30:00',
    '18:14:16.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    199,
    '2024-04-07 21:30:00',
    '20:56:12.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    200,
    '2024-04-07 21:30:00',
    '21:23:06.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    201,
    '2024-04-07 21:30:00',
    '23:24:28.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    202,
    '2024-04-07 21:30:00',
    '23:26:15.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    203,
    '2024-04-07 21:30:00',
    '23:27:27.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    204,
    '2024-04-07 21:30:00',
    '23:27:36.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    205,
    '2024-04-08 21:30:00',
    '10:10:13.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    206,
    '2024-04-08 21:30:00',
    '10:40:20.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    207,
    '2024-04-08 21:30:00',
    '12:14:48.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    208,
    '2024-04-08 21:30:00',
    '12:15:14.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    209,
    '2024-04-08 21:30:00',
    '13:18:29.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    210,
    '2024-04-08 21:30:00',
    '13:19:55.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    211,
    '2024-04-08 21:30:00',
    '13:34:34.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    212,
    '2024-04-08 21:30:00',
    '14:24:03.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    213,
    '2024-04-08 21:30:00',
    '14:24:15.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    214,
    '2024-04-08 21:30:00',
    '14:24:23.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    215,
    '2024-04-08 21:30:00',
    '16:47:18.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    216,
    '2024-04-08 21:30:00',
    '17:25:21.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    217,
    '2024-04-08 21:30:00',
    '17:36:51.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    218,
    '2024-04-09 21:30:00',
    '13:01:26.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    219,
    '2024-04-09 21:30:00',
    '13:01:32.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    220,
    '2024-04-09 21:30:00',
    '13:01:38.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    221,
    '2024-04-09 21:30:00',
    '13:01:59.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    222,
    '2024-04-09 21:30:00',
    '13:12:06.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    223,
    '2024-04-09 21:30:00',
    '13:21:54.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    224,
    '2024-04-09 21:30:00',
    '15:46:17.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    225,
    '2024-04-09 21:30:00',
    '15:50:13.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    226,
    '2024-04-09 21:30:00',
    '15:52:19.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    227,
    '2024-04-09 21:30:00',
    '16:27:48.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    228,
    '2024-04-09 21:30:00',
    '16:32:48.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    229,
    '2024-04-09 21:30:00',
    '16:36:24.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    230,
    '2024-04-09 21:30:00',
    '16:39:10.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    231,
    '2024-04-09 21:30:00',
    '16:41:21.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    232,
    '2024-04-09 21:30:00',
    '16:47:00.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    233,
    '2024-04-09 21:30:00',
    '16:47:26.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    234,
    '2024-04-09 21:30:00',
    '16:48:14.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    235,
    '2024-04-09 21:30:00',
    '16:48:46.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    236,
    '2024-04-09 21:30:00',
    '16:59:46.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    237,
    '2024-04-09 21:30:00',
    '17:02:57.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    238,
    '2024-04-09 21:30:00',
    '17:15:42.000000',
    'Treatment Producer',
    'Treatment Data Delete ',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    239,
    '2024-04-09 21:30:00',
    '17:22:21.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    240,
    '2024-04-09 21:30:00',
    '18:29:43.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    241,
    '2024-04-09 21:30:00',
    '19:43:50.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    242,
    '2024-04-09 21:30:00',
    '21:51:43.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    243,
    '2024-04-09 21:30:00',
    '21:58:53.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    244,
    '2024-04-09 21:30:00',
    '21:59:44.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    245,
    '2024-04-09 21:30:00',
    '22:01:01.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    246,
    '2024-04-10 21:30:00',
    '14:45:54.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    247,
    '2024-04-10 21:30:00',
    '14:46:16.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    248,
    '2024-04-10 21:30:00',
    '14:49:43.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    249,
    '2024-04-10 21:30:00',
    '16:35:23.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    250,
    '2024-04-10 21:30:00',
    '16:35:23.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    251,
    '2024-04-10 21:30:00',
    '16:44:01.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    252,
    '2024-04-10 21:30:00',
    '16:58:17.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    253,
    '2024-04-10 21:30:00',
    '16:58:17.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    254,
    '2024-04-10 21:30:00',
    '17:05:13.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    255,
    '2024-04-10 21:30:00',
    '17:06:46.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    256,
    '2024-04-10 21:30:00',
    '17:08:35.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    257,
    '2024-04-10 21:30:00',
    '17:13:29.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    258,
    '2024-04-10 21:30:00',
    '17:13:32.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    259,
    '2024-04-10 21:30:00',
    '17:13:32.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    260,
    '2024-04-10 21:30:00',
    '17:13:32.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    261,
    '2024-04-10 21:30:00',
    '17:13:33.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    262,
    '2024-04-10 21:30:00',
    '17:14:08.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    263,
    '2024-04-10 21:30:00',
    '17:14:18.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    264,
    '2024-04-10 21:30:00',
    '17:14:18.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    265,
    '2024-04-10 21:30:00',
    '17:14:20.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    266,
    '2024-04-10 21:30:00',
    '18:51:35.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    267,
    '2024-04-10 21:30:00',
    '18:52:01.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    268,
    '2024-04-10 21:30:00',
    '18:52:01.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    269,
    '2024-04-10 21:30:00',
    '18:52:36.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    270,
    '2024-04-10 21:30:00',
    '18:52:36.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    271,
    '2024-04-10 21:30:00',
    '18:53:33.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    272,
    '2024-04-10 21:30:00',
    '18:53:33.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    273,
    '2024-04-10 21:30:00',
    '18:59:17.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    274,
    '2024-04-10 21:30:00',
    '18:59:17.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    275,
    '2024-04-10 21:30:00',
    '19:04:06.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    276,
    '2024-04-10 21:30:00',
    '19:04:06.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    277,
    '2024-04-10 21:30:00',
    '19:06:01.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    278,
    '2024-04-10 21:30:00',
    '19:07:01.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    279,
    '2024-04-10 21:30:00',
    '19:11:00.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    280,
    '2024-04-10 21:30:00',
    '19:11:00.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    281,
    '2024-04-10 21:30:00',
    '19:11:49.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    282,
    '2024-04-10 21:30:00',
    '19:12:05.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    283,
    '2024-04-10 21:30:00',
    '19:12:05.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    284,
    '2024-04-10 21:30:00',
    '19:13:10.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    285,
    '2024-04-10 21:30:00',
    '19:13:10.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    286,
    '2024-04-10 21:30:00',
    '19:14:40.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    287,
    '2024-04-10 21:30:00',
    '19:14:57.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    288,
    '2024-04-10 21:30:00',
    '19:19:23.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    289,
    '2024-04-10 21:30:00',
    '19:19:23.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    290,
    '2024-04-10 21:30:00',
    '20:06:22.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    291,
    '2024-04-10 21:30:00',
    '20:07:04.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    292,
    '2024-04-10 21:30:00',
    '20:07:04.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    293,
    '2024-04-10 21:30:00',
    '20:08:15.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    294,
    '2024-04-10 21:30:00',
    '20:46:23.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    295,
    '2024-04-10 21:30:00',
    '20:46:43.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    296,
    '2024-04-10 21:30:00',
    '20:47:05.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    297,
    '2024-04-10 21:30:00',
    '20:54:55.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    298,
    '2024-04-10 21:30:00',
    '21:04:45.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    299,
    '2024-04-10 21:30:00',
    '21:05:41.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    300,
    '2024-04-10 21:30:00',
    '21:07:12.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    301,
    '2024-04-10 21:30:00',
    '21:07:59.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    302,
    '2024-04-10 21:30:00',
    '21:11:22.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    303,
    '2024-04-11 21:30:00',
    '15:40:33.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    304,
    '2024-04-11 21:30:00',
    '15:41:25.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    305,
    '2024-04-11 21:30:00',
    '15:42:13.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    306,
    '2024-04-11 21:30:00',
    '15:48:06.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    307,
    '2024-04-11 21:30:00',
    '16:11:27.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    308,
    '2024-04-11 21:30:00',
    '17:06:57.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    309,
    '2024-04-11 21:30:00',
    '17:29:10.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    310,
    '2024-04-11 21:30:00',
    '17:51:09.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    311,
    '2024-04-11 21:30:00',
    '18:21:40.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    312,
    '2024-04-11 21:30:00',
    '18:31:05.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    313,
    '2024-04-11 21:30:00',
    '18:35:30.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    314,
    '2024-04-11 21:30:00',
    '18:36:01.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    315,
    '2024-04-11 21:30:00',
    '19:27:47.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    316,
    '2024-04-12 21:30:00',
    '11:12:30.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    317,
    '2024-04-12 21:30:00',
    '11:19:46.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    318,
    '2024-04-12 21:30:00',
    '11:32:05.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    319,
    '2024-04-12 21:30:00',
    '11:34:04.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    320,
    '2024-04-12 21:30:00',
    '11:34:45.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    321,
    '2024-04-12 21:30:00',
    '11:35:58.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    322,
    '2024-04-12 21:30:00',
    '11:42:13.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    323,
    '2024-04-12 21:30:00',
    '12:49:37.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    324,
    '2024-04-12 21:30:00',
    '12:52:53.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    325,
    '2024-04-12 21:30:00',
    '12:53:35.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    326,
    '2024-04-12 21:30:00',
    '12:56:07.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    327,
    '2024-04-12 21:30:00',
    '12:58:11.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    328,
    '2024-04-12 21:30:00',
    '13:24:18.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    329,
    '2024-04-12 21:30:00',
    '16:22:56.000000',
    'Treatment Producer',
    'Treatment Data Delete ',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    330,
    '2024-04-12 21:30:00',
    '18:49:49.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    331,
    '2024-04-12 21:30:00',
    '18:50:17.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    332,
    '2024-04-12 21:30:00',
    '18:52:08.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    333,
    '2024-04-12 21:30:00',
    '18:52:37.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    334,
    '2024-04-12 21:30:00',
    '18:55:59.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    335,
    '2024-04-12 21:30:00',
    '19:06:07.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    336,
    '2024-04-12 21:30:00',
    '19:27:51.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    337,
    '2024-04-12 21:30:00',
    '19:35:04.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    338,
    '2024-04-13 21:30:00',
    '17:49:13.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    339,
    '2024-04-14 21:30:00',
    '10:34:14.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    340,
    '2024-04-14 21:30:00',
    '13:52:49.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    341,
    '2024-04-14 21:30:00',
    '13:57:22.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    342,
    '2024-04-14 21:30:00',
    '14:02:58.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    343,
    '2024-04-17 21:30:00',
    '12:36:52.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    344,
    '2024-04-17 21:30:00',
    '12:45:10.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    345,
    '2024-04-17 21:30:00',
    '12:45:33.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    346,
    '2024-04-17 21:30:00',
    '12:45:50.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    347,
    '2024-04-17 21:30:00',
    '12:46:38.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    348,
    '2024-04-17 21:30:00',
    '12:47:14.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    349,
    '2024-04-17 21:30:00',
    '12:48:15.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    350,
    '2024-04-17 21:30:00',
    '13:12:07.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    351,
    '2024-04-17 21:30:00',
    '14:33:22.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    352,
    '2024-04-17 21:30:00',
    '14:33:25.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    353,
    '2024-04-17 21:30:00',
    '14:44:25.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    354,
    '2024-04-18 21:30:00',
    '13:12:30.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    355,
    '2024-04-18 21:30:00',
    '13:12:51.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    356,
    '2024-04-18 21:30:00',
    '13:14:24.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    357,
    '2024-04-18 21:30:00',
    '13:14:50.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    358,
    '2024-04-18 21:30:00',
    '13:15:23.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    359,
    '2024-04-18 21:30:00',
    '13:15:35.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    360,
    '2024-04-18 21:30:00',
    '13:15:51.000000',
    'Treatment Suggest',
    'Select Treatment Plan',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    361,
    '2024-04-18 21:30:00',
    '13:17:33.000000',
    'Secuirty Amount',
    'Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    362,
    '2024-04-18 21:30:00',
    '13:23:33.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    363,
    '2024-04-18 21:30:00',
    '13:30:56.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    364,
    '2024-04-18 21:30:00',
    '13:36:28.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    365,
    '2024-04-18 21:30:00',
    '14:20:06.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    366,
    '2024-04-18 21:30:00',
    '14:20:18.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    367,
    '2024-04-18 21:30:00',
    '14:36:28.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    368,
    '2024-04-18 21:30:00',
    '14:37:37.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    369,
    '2024-04-18 21:30:00',
    '14:40:59.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    370,
    '2024-04-18 21:30:00',
    '14:46:01.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    371,
    '2024-04-18 21:30:00',
    '14:46:12.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    372,
    '2024-04-18 21:30:00',
    '14:47:12.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    373,
    '2024-04-18 21:30:00',
    '14:47:37.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    374,
    '2024-04-18 21:30:00',
    '15:03:40.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    375,
    '2024-04-18 21:30:00',
    '15:03:56.000000',
    'Medical Prescription',
    'Add Medicine',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    376,
    '2024-04-18 21:30:00',
    '15:03:58.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    377,
    '2024-04-18 21:30:00',
    '15:05:23.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    378,
    '2024-04-18 21:30:00',
    '15:05:29.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    379,
    '2024-04-18 21:30:00',
    '15:11:54.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    380,
    '2024-04-18 21:30:00',
    '15:12:15.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    381,
    '2024-04-18 21:30:00',
    '16:23:16.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    382,
    '2024-04-18 21:30:00',
    '16:33:17.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    383,
    '2024-04-18 21:30:00',
    '19:56:18.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    384,
    '2024-04-18 21:30:00',
    '20:11:23.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    385,
    '2024-04-18 21:30:00',
    '20:12:22.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    386,
    '2024-04-18 21:30:00',
    '20:25:40.000000',
    'Treatment Producer',
    'Treatment Start',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    387,
    '2024-04-18 21:30:00',
    '20:25:48.000000',
    'Bill Data',
    'Add Bill Data Patient Table',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    388,
    '2024-04-18 21:30:00',
    '21:06:24.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    389,
    '2024-04-18 21:30:00',
    '21:19:28.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    390,
    '2024-04-18 21:30:00',
    '21:20:29.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    391,
    '2024-04-18 21:30:00',
    '21:21:03.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    392,
    '2024-04-18 21:30:00',
    '21:22:40.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    393,
    '2024-04-18 21:30:00',
    '21:24:09.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    394,
    '2024-04-18 21:30:00',
    '21:27:14.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    395,
    '2024-04-19 21:30:00',
    '19:00:16.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    396,
    '2024-04-19 21:30:00',
    '19:57:07.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    397,
    '2024-04-19 21:30:00',
    '19:57:45.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    398,
    '2024-04-19 21:30:00',
    '19:57:59.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    399,
    '2024-04-19 21:30:00',
    '20:11:21.000000',
    'Examiantion',
    'Add Teeth Dental-X',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    400,
    '2024-04-19 21:30:00',
    '20:18:52.000000',
    'Treatment Suggest',
    'Select Treatment Digital Compuler zcd XRay (R.V.G.) for desease Caries',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    401,
    '2024-04-19 21:30:00',
    '20:21:26.000000',
    'Secuirty Amount',
    '300 Secuirty Amount Added',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    402,
    '2024-04-19 21:30:00',
    '20:31:53.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    403,
    '2024-04-19 21:30:00',
    '20:45:43.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    404,
    '2024-04-19 21:30:00',
    '20:50:25.000000',
    'Security Amount Used',
    '300 security amount used',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    405,
    '2024-04-19 21:30:00',
    '20:59:35.000000',
    'Security Amount Used',
    '300 security amount used',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    406,
    '2024-04-19 21:30:00',
    '20:59:44.000000',
    'Treatment Procedure',
    'Sitting Done',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    407,
    '2024-04-19 21:30:00',
    '21:01:43.000000',
    'Security Amount Used',
    '300 security amount used',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    408,
    '2024-04-19 21:30:00',
    '21:10:53.000000',
    'Security Amount Used',
    '300 security amount used',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    409,
    '2024-04-19 21:30:00',
    '21:11:18.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    410,
    '2024-04-19 21:30:00',
    '21:13:07.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    411,
    '2024-04-19 21:30:00',
    '21:14:07.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    412,
    '2024-04-19 21:30:00',
    '21:15:08.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    413,
    '2024-04-19 21:30:00',
    '21:15:19.000000',
    'Treatment Procedure',
    'Digital Compuler zcd XRay (R.V.G.) Treatment Done, TPID : 33',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    414,
    '2024-04-19 21:30:00',
    '21:19:37.000000',
    'Final Bill Generation',
    'Final Bill Generated for 33',
    'Madan Mahal',
    '789012'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    415,
    '2024-04-20 21:30:00',
    '17:15:50.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    416,
    '2024-04-20 21:30:00',
    '17:16:06.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    417,
    '2024-04-20 21:30:00',
    '17:16:10.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    418,
    '2024-04-20 21:30:00',
    '17:19:04.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    419,
    '2024-04-20 21:30:00',
    '17:20:47.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Mobility',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    420,
    '2024-04-20 21:30:00',
    '17:21:06.000000',
    'Secuirty Amount',
    '300 Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    421,
    '2024-04-20 21:30:00',
    '17:23:48.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    422,
    '2024-04-20 21:30:00',
    '17:25:54.000000',
    'Security Amount Used',
    '300 security amount used',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    423,
    '2024-04-20 21:30:00',
    '17:26:05.000000',
    'Treatment Procedure',
    'Digital Compuler zcd XRay (R.V.G.) Treatment Done, TPID : 35',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    424,
    '2024-04-20 21:30:00',
    '17:27:39.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    425,
    '2024-04-20 21:30:00',
    '17:27:44.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    426,
    '2024-04-20 21:30:00',
    '17:31:04.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : 35',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    427,
    '2024-04-20 21:30:00',
    '19:22:03.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    428,
    '2024-04-20 21:30:00',
    '19:26:11.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    429,
    '2024-04-20 21:30:00',
    '19:29:36.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    430,
    '2024-04-20 21:30:00',
    '19:40:59.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    431,
    '2024-04-20 21:30:00',
    '20:30:24.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Mobility',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    432,
    '2024-04-20 21:30:00',
    '20:31:50.000000',
    'Secuirty Amount',
    '300 Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    433,
    '2024-04-20 21:30:00',
    '20:32:40.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    434,
    '2024-04-20 21:30:00',
    '20:57:47.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    435,
    '2024-04-21 21:30:00',
    '12:26:47.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 37',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    436,
    '2024-04-21 21:30:00',
    '12:58:51.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    437,
    '2024-04-21 21:30:00',
    '12:59:24.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    438,
    '2024-04-23 21:30:00',
    '15:06:18.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    439,
    '2024-04-23 21:30:00',
    '15:12:14.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    440,
    '2024-04-23 21:30:00',
    '15:12:52.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    441,
    '2024-04-23 21:30:00',
    '15:13:28.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    442,
    '2024-04-23 21:30:00',
    '15:14:39.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    443,
    '2024-04-23 21:30:00',
    '15:15:18.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    444,
    '2024-04-23 21:30:00',
    '15:20:03.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    445,
    '2024-04-23 21:30:00',
    '16:04:31.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Caries',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    446,
    '2024-04-23 21:30:00',
    '16:05:32.000000',
    'Treatment Suggest',
    'Select Treatment : Re-Root Canal Treatlment @ per tooth for desease : Fracture',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    447,
    '2024-04-23 21:30:00',
    '16:05:52.000000',
    'Treatment Suggest',
    'Select Treatment : Porcelain Fused to Metal @ per Crown for desease : Caries',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    448,
    '2024-04-23 21:30:00',
    '16:07:31.000000',
    'Secuirty Amount',
    '4000 Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    449,
    '2024-04-23 21:30:00',
    '16:09:51.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    450,
    '2024-04-23 21:30:00',
    '16:10:22.000000',
    'Security Amount Used',
    '540 security amount used',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    451,
    '2024-04-23 21:30:00',
    '16:11:24.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    452,
    '2024-04-23 21:30:00',
    '16:12:05.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    453,
    '2024-04-23 21:30:00',
    '16:12:12.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    454,
    '2024-04-23 21:30:00',
    '16:22:00.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 39',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    455,
    '2024-04-23 21:30:00',
    '16:22:43.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 39',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    456,
    '2024-04-23 21:30:00',
    '16:25:15.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 39',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    457,
    '2024-04-23 21:30:00',
    '16:26:52.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    458,
    '2024-04-23 21:30:00',
    '16:29:05.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    459,
    '2024-04-23 21:30:00',
    '16:45:10.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    460,
    '2024-04-23 21:30:00',
    '16:45:10.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 39',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    461,
    '2024-04-23 21:30:00',
    '16:46:44.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    462,
    '2024-04-23 21:30:00',
    '16:47:02.000000',
    'Treatment Procedure',
    'Digital Compuler zcd XRay (R.V.G.) Treatment Done, TPID : 39',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    463,
    '2024-04-23 21:30:00',
    '16:47:19.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : 39',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    464,
    '2024-04-23 21:30:00',
    '18:28:55.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    465,
    '2024-04-23 21:30:00',
    '18:33:50.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    466,
    '2024-04-23 21:30:00',
    '19:00:56.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    467,
    '2024-04-23 21:30:00',
    '19:02:05.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    468,
    '2024-04-23 21:30:00',
    '19:02:50.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    469,
    '2024-04-23 21:30:00',
    '19:03:38.000000',
    'Security Amount Used',
    '1882 security amount used',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    470,
    '2024-04-23 21:30:00',
    '19:04:30.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    471,
    '2024-04-23 21:30:00',
    '19:04:31.000000',
    'Treatment Procedure',
    'Re-Root Canal Treatlment @ per tooth Treatment Done, TPID : 39',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    472,
    '2024-04-23 21:30:00',
    '19:05:14.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    473,
    '2024-04-23 21:30:00',
    '19:05:14.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    474,
    '2024-04-23 21:30:00',
    '19:05:14.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    475,
    '2024-04-23 21:30:00',
    '19:05:26.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    476,
    '2024-04-23 21:30:00',
    '19:52:31.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    477,
    '2024-04-23 21:30:00',
    '19:52:50.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    478,
    '2024-04-23 21:30:00',
    '19:53:00.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    479,
    '2024-04-23 21:30:00',
    '19:53:11.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    480,
    '2024-04-23 21:30:00',
    '19:54:28.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    481,
    '2024-04-23 21:30:00',
    '19:55:53.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    482,
    '2024-04-23 21:30:00',
    '20:07:22.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    483,
    '2024-04-23 21:30:00',
    '20:08:18.000000',
    'Treatment Suggest',
    'Select Treatment : Biopsy for desease : Caries',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    484,
    '2024-04-23 21:30:00',
    '20:09:02.000000',
    'Secuirty Amount',
    '2500 Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    485,
    '2024-04-23 21:30:00',
    '20:10:02.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    486,
    '2024-04-23 21:30:00',
    '20:10:16.000000',
    'Security Amount Used',
    '2375 security amount used',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    487,
    '2024-04-23 21:30:00',
    '20:10:57.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    488,
    '2024-04-23 21:30:00',
    '20:10:57.000000',
    'Treatment Procedure',
    'Biopsy Treatment Done, TPID : 42',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    489,
    '2024-04-23 21:30:00',
    '20:11:21.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    490,
    '2024-04-23 21:30:00',
    '20:11:29.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    491,
    '2024-04-23 21:30:00',
    '20:13:48.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    492,
    '2024-04-23 21:30:00',
    '20:13:53.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : null',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    493,
    '2024-04-23 21:30:00',
    '20:15:06.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    494,
    '2024-04-23 21:30:00',
    '20:15:37.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    495,
    '2024-04-23 21:30:00',
    '20:16:13.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    496,
    '2024-04-23 21:30:00',
    '20:16:18.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : 42',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    497,
    '2024-04-23 21:30:00',
    '20:16:59.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    498,
    '2024-04-23 21:30:00',
    '20:17:14.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    499,
    '2024-04-23 21:30:00',
    '20:18:38.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    500,
    '2024-04-23 21:30:00',
    '20:26:30.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    501,
    '2024-04-23 21:30:00',
    '20:27:55.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    502,
    '2024-04-23 21:30:00',
    '20:35:16.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    503,
    '2024-04-23 21:30:00',
    '20:44:19.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    504,
    '2024-04-23 21:30:00',
    '20:45:42.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    505,
    '2024-04-23 21:30:00',
    '20:48:30.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    506,
    '2024-04-23 21:30:00',
    '20:56:59.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_22'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    507,
    '2024-04-23 21:30:00',
    '21:07:05.000000',
    'Cancel Appointment',
    'Cancel Appointment',
    'Madan Mahal',
    'DH_22'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    508,
    '2024-04-23 21:30:00',
    '21:16:19.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    509,
    '2024-04-23 21:30:00',
    '21:17:12.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    510,
    '2024-04-23 21:30:00',
    '21:17:23.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    511,
    '2024-04-23 21:30:00',
    '21:18:04.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    512,
    '2024-04-23 21:30:00',
    '21:19:49.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    513,
    '2024-04-23 21:30:00',
    '21:20:07.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    514,
    '2024-04-23 21:30:00',
    '21:20:33.000000',
    'Edit Appointment',
    'Edit Appointment',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    515,
    '2024-04-23 21:30:00',
    '21:22:05.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    516,
    '2024-04-23 21:30:00',
    '21:22:45.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    517,
    '2024-04-23 21:30:00',
    '21:22:46.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    518,
    '2024-04-23 21:30:00',
    '21:23:06.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    519,
    '2024-04-23 21:30:00',
    '21:24:10.000000',
    'Treatment Suggest',
    'Select Treatment : Root Canal Treatment @ per tooth for desease : Caries',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    520,
    '2024-04-23 21:30:00',
    '21:25:51.000000',
    'Secuirty Amount',
    '1000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    521,
    '2024-04-23 21:30:00',
    '21:30:16.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    522,
    '2024-04-23 21:30:00',
    '21:30:47.000000',
    'Security Amount Used',
    '1000 security amount used',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    523,
    '2024-04-23 21:30:00',
    '21:31:48.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 43',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    524,
    '2024-04-23 21:30:00',
    '21:32:11.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    525,
    '2024-04-23 21:30:00',
    '21:32:15.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    526,
    '2024-04-23 21:30:00',
    '21:53:40.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    527,
    '2024-04-23 21:30:00',
    '21:55:03.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    528,
    '2024-04-23 21:30:00',
    '21:55:11.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    529,
    '2024-04-23 21:30:00',
    '21:55:16.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    530,
    '2024-04-23 21:30:00',
    '22:06:52.000000',
    'Examiantion',
    'Cancel Treatment',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    531,
    '2024-04-23 21:30:00',
    '22:19:47.000000',
    'Patient Profile',
    'Patient Profile Updated',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    532,
    '2024-04-23 21:30:00',
    '22:31:44.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    533,
    '2024-04-23 21:30:00',
    '22:32:04.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    534,
    '2024-04-23 21:30:00',
    '22:32:15.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    535,
    '2024-04-23 21:30:00',
    '22:32:18.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    536,
    '2024-04-23 21:30:00',
    '22:32:32.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    537,
    '2024-04-23 21:30:00',
    '22:32:56.000000',
    'Treatment Suggest',
    'Select Treatment : Re-Root Canal Treatlment @ per tooth for desease : Caries',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    538,
    '2024-04-23 21:30:00',
    '22:33:55.000000',
    'Secuirty Amount',
    '4000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    539,
    '2024-04-23 21:30:00',
    '22:40:03.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    540,
    '2024-04-23 21:30:00',
    '22:41:05.000000',
    'Security Amount Used',
    '3600 security amount used',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    541,
    '2024-04-23 21:30:00',
    '22:41:27.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 45',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    542,
    '2024-04-23 21:30:00',
    '22:41:42.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    543,
    '2024-04-23 21:30:00',
    '22:41:44.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    544,
    '2024-04-23 21:30:00',
    '22:44:29.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    545,
    '2024-04-23 21:30:00',
    '23:20:03.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    546,
    '2024-04-23 21:30:00',
    '23:23:14.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    547,
    '2024-04-23 21:30:00',
    '23:23:17.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    548,
    '2024-04-23 21:30:00',
    '23:23:54.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    549,
    '2024-04-23 21:30:00',
    '23:24:08.000000',
    'Treatment Suggest',
    'Select Treatment : Root Canal Treatment @ per tooth for desease : Caries',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    550,
    '2024-04-23 21:30:00',
    '23:24:17.000000',
    'Secuirty Amount',
    '3000 Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    551,
    '2024-04-23 21:30:00',
    '23:24:26.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    552,
    '2024-04-24 21:30:00',
    '00:28:59.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    553,
    '2024-04-24 21:30:00',
    '00:30:16.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    554,
    '2024-04-24 21:30:00',
    '00:32:10.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    555,
    '2024-04-24 21:30:00',
    '13:41:50.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    556,
    '2024-04-24 21:30:00',
    '13:49:47.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    557,
    '2024-04-24 21:30:00',
    '14:11:50.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    558,
    '2024-04-24 21:30:00',
    '14:16:29.000000',
    'Edit Appointment',
    'Edit Appointment',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    559,
    '2024-04-24 21:30:00',
    '14:16:59.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    560,
    '2024-04-24 21:30:00',
    '14:22:00.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    561,
    '2024-04-24 21:30:00',
    '14:25:15.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    562,
    '2024-04-24 21:30:00',
    '14:25:15.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    563,
    '2024-04-24 21:30:00',
    '14:32:18.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_10'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    564,
    '2024-04-24 21:30:00',
    '14:40:07.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    565,
    '2024-04-24 21:30:00',
    '14:40:29.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    566,
    '2024-04-24 21:30:00',
    '14:40:52.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    567,
    '2024-04-24 21:30:00',
    '14:42:43.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    568,
    '2024-04-24 21:30:00',
    '14:44:43.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    569,
    '2024-04-24 21:30:00',
    '14:53:00.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    570,
    '2024-04-24 21:30:00',
    '14:55:56.000000',
    'Patient Profile',
    'Patient Profile Updated',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    571,
    '2024-04-24 21:30:00',
    '14:56:10.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    572,
    '2024-04-24 21:30:00',
    '15:05:14.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    573,
    '2024-04-24 21:30:00',
    '15:06:03.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    574,
    '2024-04-24 21:30:00',
    '15:07:51.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_23'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    575,
    '2024-04-24 21:30:00',
    '15:08:05.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    576,
    '2024-04-24 21:30:00',
    '15:09:34.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    577,
    '2024-04-24 21:30:00',
    '16:42:51.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    578,
    '2024-04-24 21:30:00',
    '16:42:53.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    579,
    '2024-04-24 21:30:00',
    '16:46:08.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    580,
    '2024-04-24 21:30:00',
    '16:46:20.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    581,
    '2024-04-24 21:30:00',
    '16:46:22.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    582,
    '2024-04-24 21:30:00',
    '16:47:40.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    583,
    '2024-04-24 21:30:00',
    '16:50:01.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    584,
    '2024-04-24 21:30:00',
    '16:50:02.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    585,
    '2024-04-24 21:30:00',
    '16:51:41.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    586,
    '2024-04-24 21:30:00',
    '16:51:44.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    587,
    '2024-04-24 21:30:00',
    '16:52:16.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    588,
    '2024-04-24 21:30:00',
    '16:52:33.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    589,
    '2024-04-24 21:30:00',
    '16:53:22.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    590,
    '2024-04-24 21:30:00',
    '16:58:20.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    591,
    '2024-04-24 21:30:00',
    '16:58:48.000000',
    'Edit Appointment',
    'Edit Appointment',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    592,
    '2024-04-24 21:30:00',
    '16:58:52.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    593,
    '2024-04-24 21:30:00',
    '16:59:04.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    594,
    '2024-04-24 21:30:00',
    '16:59:11.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    595,
    '2024-04-24 21:30:00',
    '16:59:24.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    596,
    '2024-04-24 21:30:00',
    '16:59:42.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    597,
    '2024-04-24 21:30:00',
    '17:05:13.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Caries',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    598,
    '2024-04-24 21:30:00',
    '17:05:33.000000',
    'Secuirty Amount',
    '300 Secuirty Amount Added',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    599,
    '2024-04-24 21:30:00',
    '17:05:47.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    600,
    '2024-04-24 21:30:00',
    '17:06:54.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    601,
    '2024-04-24 21:30:00',
    '17:06:55.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 53',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    602,
    '2024-04-24 21:30:00',
    '17:07:24.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    603,
    '2024-04-24 21:30:00',
    '17:07:30.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    604,
    '2024-04-24 21:30:00',
    '17:08:22.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    605,
    '2024-04-24 21:30:00',
    '17:08:23.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    606,
    '2024-04-24 21:30:00',
    '17:09:33.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    607,
    '2024-04-24 21:30:00',
    '17:09:43.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    608,
    '2024-04-24 21:30:00',
    '17:09:44.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    609,
    '2024-04-24 21:30:00',
    '17:10:43.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    610,
    '2024-04-24 21:30:00',
    '17:10:50.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    611,
    '2024-04-24 21:30:00',
    '17:10:52.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    612,
    '2024-04-24 21:30:00',
    '17:13:03.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    613,
    '2024-04-24 21:30:00',
    '17:14:18.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    614,
    '2024-04-24 21:30:00',
    '17:14:18.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    615,
    '2024-04-24 21:30:00',
    '17:25:24.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    616,
    '2024-04-24 21:30:00',
    '17:25:26.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    617,
    '2024-04-24 21:30:00',
    '17:25:39.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    618,
    '2024-04-24 21:30:00',
    '17:25:57.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Caries',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    619,
    '2024-04-24 21:30:00',
    '17:26:16.000000',
    'Secuirty Amount',
    '300 Secuirty Amount Added',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    620,
    '2024-04-24 21:30:00',
    '17:26:43.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    621,
    '2024-04-24 21:30:00',
    '17:26:52.000000',
    'Security Amount Used',
    '285 security amount used',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    622,
    '2024-04-24 21:30:00',
    '17:28:56.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    623,
    '2024-04-24 21:30:00',
    '17:28:57.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 57',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    624,
    '2024-04-24 21:30:00',
    '17:29:09.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    625,
    '2024-04-24 21:30:00',
    '17:29:14.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    626,
    '2024-04-24 21:30:00',
    '17:30:00.000000',
    'Treatment Procedure',
    'Digital Compuler zcd XRay (R.V.G.) Treatment Done, TPID : 57',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    627,
    '2024-04-24 21:30:00',
    '17:30:01.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    628,
    '2024-04-24 21:30:00',
    '17:30:12.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    629,
    '2024-04-24 21:30:00',
    '17:31:26.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : 57',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    630,
    '2024-04-24 21:30:00',
    '17:42:08.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    631,
    '2024-04-24 21:30:00',
    '17:42:11.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    632,
    '2024-04-24 21:30:00',
    '17:42:18.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    633,
    '2024-04-24 21:30:00',
    '17:43:04.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    634,
    '2024-04-24 21:30:00',
    '17:43:50.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    635,
    '2024-04-24 21:30:00',
    '17:45:56.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    636,
    '2024-04-24 21:30:00',
    '17:46:01.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    637,
    '2024-04-24 21:30:00',
    '17:46:25.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    638,
    '2024-04-24 21:30:00',
    '17:49:05.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    639,
    '2024-04-24 21:30:00',
    '17:49:08.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    640,
    '2024-04-24 21:30:00',
    '17:49:47.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    641,
    '2024-04-24 21:30:00',
    '17:51:21.000000',
    'Treatment Suggest',
    'Select Treatment : Single Implant for desease : Missing Tooth',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    642,
    '2024-04-24 21:30:00',
    '17:51:46.000000',
    'Secuirty Amount',
    '5000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    643,
    '2024-04-24 21:30:00',
    '17:52:02.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    644,
    '2024-04-24 21:30:00',
    '17:52:17.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    645,
    '2024-04-24 21:30:00',
    '17:52:48.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    646,
    '2024-04-24 21:30:00',
    '17:52:50.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    647,
    '2024-04-24 21:30:00',
    '17:53:34.000000',
    'Treatment Procedure',
    'Single Implant Treatment Done, TPID : 63',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    648,
    '2024-04-24 21:30:00',
    '17:54:07.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    649,
    '2024-04-24 21:30:00',
    '17:54:08.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    650,
    '2024-04-24 21:30:00',
    '17:54:24.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    651,
    '2024-04-24 21:30:00',
    '17:54:26.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    652,
    '2024-04-24 21:30:00',
    '17:57:20.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    653,
    '2024-04-24 21:30:00',
    '17:58:07.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    654,
    '2024-04-24 21:30:00',
    '18:03:03.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    655,
    '2024-04-24 21:30:00',
    '18:03:05.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    656,
    '2024-04-24 21:30:00',
    '18:18:00.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    657,
    '2024-04-24 21:30:00',
    '18:18:45.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    658,
    '2024-04-24 21:30:00',
    '18:25:51.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    659,
    '2024-04-24 21:30:00',
    '18:27:39.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    660,
    '2024-04-24 21:30:00',
    '18:33:11.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    661,
    '2024-04-24 21:30:00',
    '18:33:58.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    662,
    '2024-04-24 21:30:00',
    '18:37:57.000000',
    'Treatment Suggest',
    'Select Treatment : Pulpectomy (Child) @ per tooth for desease : Impacted',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    663,
    '2024-04-24 21:30:00',
    '18:39:25.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    664,
    '2024-04-24 21:30:00',
    '18:40:06.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    665,
    '2024-04-24 21:30:00',
    '18:40:17.000000',
    'Treatment Suggest',
    'Select Treatment : Re-Root Canal Treatlment @ per tooth for desease : Missing Tooth',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    666,
    '2024-04-24 21:30:00',
    '18:42:59.000000',
    'Treatment Suggest',
    'Select Treatment : I& D ( ntra Oral) for desease : Root Stump',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    667,
    '2024-04-24 21:30:00',
    '18:44:55.000000',
    'Treatment Suggest',
    'Select Treatment : Amalgam Restoration@ per tooth for desease : Root Stump',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    668,
    '2024-04-24 21:30:00',
    '18:45:51.000000',
    'Secuirty Amount',
    '7600 Secuirty Amount Added',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    669,
    '2024-04-24 21:30:00',
    '18:50:53.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    670,
    '2024-04-24 21:30:00',
    '18:55:13.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    671,
    '2024-04-24 21:30:00',
    '18:59:57.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    672,
    '2024-04-24 21:30:00',
    '19:01:36.000000',
    'Treatment Procedure',
    'Pulpectomy (Child) @ per tooth Treatment Done, TPID : 65',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    673,
    '2024-04-24 21:30:00',
    '19:02:06.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    674,
    '2024-04-24 21:30:00',
    '19:02:20.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    675,
    '2024-04-24 21:30:00',
    '19:02:22.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    676,
    '2024-04-24 21:30:00',
    '20:17:09.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    677,
    '2024-04-24 21:30:00',
    '20:17:11.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    678,
    '2024-04-24 21:30:00',
    '20:45:23.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_17'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    679,
    '2024-04-24 21:30:00',
    '20:46:43.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    680,
    '2024-04-24 21:30:00',
    '20:52:11.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    681,
    '2024-04-24 21:30:00',
    '20:57:10.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    682,
    '2024-04-24 21:30:00',
    '20:58:21.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    683,
    '2024-04-24 21:30:00',
    '21:03:55.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Periapical Abscess',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    684,
    '2024-04-24 21:30:00',
    '21:04:13.000000',
    'Secuirty Amount',
    '500 Secuirty Amount Added',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    685,
    '2024-04-24 21:30:00',
    '21:25:25.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    686,
    '2024-04-24 21:30:00',
    '21:25:47.000000',
    'Security Amount Used',
    '300 security amount used',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    687,
    '2024-04-24 21:30:00',
    '21:29:34.000000',
    'Treatment Procedure',
    'Digital Compuler zcd XRay (R.V.G.) Treatment Done, TPID : 67',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    688,
    '2024-04-24 21:30:00',
    '21:29:50.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    689,
    '2024-04-24 21:30:00',
    '21:29:58.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    690,
    '2024-04-24 21:30:00',
    '21:38:47.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    691,
    '2024-04-24 21:30:00',
    '21:38:52.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_21'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    692,
    '2024-04-24 21:30:00',
    '22:11:27.000000',
    'Patient Profile',
    'Patient Profile Updated',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    693,
    '2024-04-24 21:30:00',
    '22:12:42.000000',
    'Patient Profile',
    'Patient Profile Updated',
    'Madan Mahal',
    'dg_1'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    694,
    '2024-04-25 21:30:00',
    '13:15:37.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    695,
    '2024-04-25 21:30:00',
    '13:15:45.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    696,
    '2024-04-25 21:30:00',
    '13:15:47.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    697,
    '2024-04-25 21:30:00',
    '13:15:58.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    698,
    '2024-04-25 21:30:00',
    '13:16:25.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Caries',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    699,
    '2024-04-25 21:30:00',
    '13:16:46.000000',
    'Treatment Suggest',
    'Select Treatment : Root Canal Treatment @ per tooth for desease : Caries',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    700,
    '2024-04-25 21:30:00',
    '13:17:04.000000',
    'Secuirty Amount',
    '200 Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    701,
    '2024-04-25 21:30:00',
    '13:17:20.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    702,
    '2024-04-25 21:30:00',
    '14:15:14.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    703,
    '2024-04-25 21:30:00',
    '14:15:59.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    704,
    '2024-04-25 21:30:00',
    '14:18:29.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    705,
    '2024-04-25 21:30:00',
    '14:24:16.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    706,
    '2024-04-25 21:30:00',
    '14:30:58.000000',
    'Treatment Suggest',
    'Select Treatment : Root Canal Treatment @ per tooth for desease : Periapical Abscess',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    707,
    '2024-04-25 21:30:00',
    '14:37:56.000000',
    'Secuirty Amount',
    '3000 Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    708,
    '2024-04-25 21:30:00',
    '16:10:55.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    709,
    '2024-04-25 21:30:00',
    '16:35:54.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    710,
    '2024-04-25 21:30:00',
    '16:36:21.000000',
    'Edit Appointment',
    'Edit Appointment',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    711,
    '2024-04-25 21:30:00',
    '16:36:27.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    712,
    '2024-04-25 21:30:00',
    '16:36:41.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    713,
    '2024-04-25 21:30:00',
    '16:36:43.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    714,
    '2024-04-25 21:30:00',
    '16:37:14.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    715,
    '2024-04-25 21:30:00',
    '16:37:30.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    716,
    '2024-04-25 21:30:00',
    '16:37:56.000000',
    'Treatment Suggest',
    'Select Treatment : Root Canal Treatment @ per tooth for desease : Caries',
    'Madan Mahal',
    'DH_20'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    717,
    '2024-04-25 21:30:00',
    '16:38:29.000000',
    'Secuirty Amount',
    '2000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    718,
    '2024-04-25 21:30:00',
    '16:38:48.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    719,
    '2024-04-25 21:30:00',
    '16:39:40.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    720,
    '2024-04-25 21:30:00',
    '16:39:40.000000',
    'Treatment Procedure',
    'Root Canal Treatment @ per tooth Treatment Done, TPID : 71',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    721,
    '2024-04-25 21:30:00',
    '16:41:38.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    722,
    '2024-04-25 21:30:00',
    '16:41:38.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    723,
    '2024-04-25 21:30:00',
    '16:41:42.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    724,
    '2024-04-25 21:30:00',
    '16:41:59.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    725,
    '2024-04-25 21:30:00',
    '16:42:02.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    726,
    '2024-04-25 21:30:00',
    '16:43:42.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    727,
    '2024-04-25 21:30:00',
    '16:43:44.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    728,
    '2024-04-25 21:30:00',
    '17:24:54.000000',
    'Security Amount Used',
    '3000 security amount used',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    729,
    '2024-04-25 21:30:00',
    '17:25:22.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 70',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    730,
    '2024-04-25 21:30:00',
    '17:29:30.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 70',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    731,
    '2024-04-25 21:30:00',
    '18:06:13.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 70',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    732,
    '2024-04-25 21:30:00',
    '18:09:51.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    733,
    '2024-04-25 21:30:00',
    '18:10:29.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    734,
    '2024-04-25 21:30:00',
    '18:28:07.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    735,
    '2024-04-25 21:30:00',
    '18:36:43.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 70',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    736,
    '2024-04-25 21:30:00',
    '18:37:06.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    737,
    '2024-04-25 21:30:00',
    '18:39:45.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    738,
    '2024-04-25 21:30:00',
    '18:39:51.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    739,
    '2024-04-25 21:30:00',
    '18:42:09.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    740,
    '2024-04-25 21:30:00',
    '18:42:16.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    741,
    '2024-04-25 21:30:00',
    '18:42:19.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    742,
    '2024-04-25 21:30:00',
    '18:44:35.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    743,
    '2024-04-25 21:30:00',
    '18:45:00.000000',
    'Cancel Appointment',
    'Cancel Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    744,
    '2024-04-25 21:30:00',
    '18:48:23.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    745,
    '2024-04-25 21:30:00',
    '18:53:58.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    746,
    '2024-04-25 21:30:00',
    '18:53:58.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 70',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    747,
    '2024-04-25 21:30:00',
    '18:56:26.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    748,
    '2024-04-25 21:30:00',
    '18:59:46.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    749,
    '2024-04-25 21:30:00',
    '18:59:46.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 70',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    750,
    '2024-04-25 21:30:00',
    '20:21:43.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    751,
    '2024-04-25 21:30:00',
    '20:23:48.000000',
    'Security Amount Used',
    '5400 security amount used',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    752,
    '2024-04-25 21:30:00',
    '20:36:54.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    753,
    '2024-04-25 21:30:00',
    '21:35:01.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    754,
    '2024-04-26 21:30:00',
    '14:16:10.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    755,
    '2024-04-26 21:30:00',
    '14:52:08.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    756,
    '2024-04-26 21:30:00',
    '14:52:46.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    757,
    '2024-04-26 21:30:00',
    '14:53:33.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    758,
    '2024-04-26 21:30:00',
    '15:53:36.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    759,
    '2024-04-26 21:30:00',
    '15:55:43.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    760,
    '2024-04-26 21:30:00',
    '15:56:34.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    761,
    '2024-04-26 21:30:00',
    '15:57:01.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Caries',
    'Madan Mahal',
    'DH_24'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    762,
    '2024-04-26 21:30:00',
    '15:57:15.000000',
    'Secuirty Amount',
    '2000 Secuirty Amount Added',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    763,
    '2024-04-26 21:30:00',
    '15:57:30.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    764,
    '2024-04-26 21:30:00',
    '15:57:36.000000',
    'Security Amount Used',
    '270 security amount used',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    765,
    '2024-04-26 21:30:00',
    '15:57:55.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    766,
    '2024-04-26 21:30:00',
    '15:57:58.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 74',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    767,
    '2024-04-26 21:30:00',
    '15:58:11.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    768,
    '2024-04-26 21:30:00',
    '15:58:19.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    769,
    '2024-04-26 21:30:00',
    '17:07:56.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    770,
    '2024-04-26 21:30:00',
    '17:11:39.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    771,
    '2024-04-26 21:30:00',
    '17:12:26.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    772,
    '2024-04-26 21:30:00',
    '17:12:34.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    773,
    '2024-04-26 21:30:00',
    '17:19:04.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    774,
    '2024-04-26 21:30:00',
    '17:19:28.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 70',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    775,
    '2024-04-26 21:30:00',
    '17:20:19.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    776,
    '2024-04-26 21:30:00',
    '18:18:40.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    777,
    '2024-04-26 21:30:00',
    '18:18:50.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    778,
    '2024-04-26 21:30:00',
    '18:18:54.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    779,
    '2024-04-26 21:30:00',
    '18:19:17.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    780,
    '2024-04-26 21:30:00',
    '18:19:32.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Fracture',
    'Madan Mahal',
    'DH_12'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    781,
    '2024-04-26 21:30:00',
    '18:19:51.000000',
    'Secuirty Amount',
    '300 Secuirty Amount Added',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    782,
    '2024-04-26 21:30:00',
    '18:20:48.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    783,
    '2024-04-26 21:30:00',
    '18:20:54.000000',
    'Security Amount Used',
    '300 security amount used',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    784,
    '2024-04-26 21:30:00',
    '18:21:35.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    785,
    '2024-04-26 21:30:00',
    '18:21:35.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    786,
    '2024-04-26 21:30:00',
    '18:21:35.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 75',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    787,
    '2024-04-26 21:30:00',
    '18:21:35.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 75',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    788,
    '2024-04-26 21:30:00',
    '18:21:51.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    789,
    '2024-04-26 21:30:00',
    '18:28:02.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    790,
    '2024-04-26 21:30:00',
    '18:28:02.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    791,
    '2024-04-26 21:30:00',
    '20:11:24.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    792,
    '2024-04-26 21:30:00',
    '20:14:50.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    793,
    '2024-04-26 21:30:00',
    '20:15:24.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    794,
    '2024-04-26 21:30:00',
    '20:15:24.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    795,
    '2024-04-26 21:30:00',
    '20:15:24.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    796,
    '2024-04-26 21:30:00',
    '20:16:43.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    797,
    '2024-04-26 21:30:00',
    '20:22:25.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    798,
    '2024-04-26 21:30:00',
    '20:24:09.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'null'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    799,
    '2024-04-26 21:30:00',
    '20:28:20.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    800,
    '2024-04-26 21:30:00',
    '20:30:29.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    801,
    '2024-04-26 21:30:00',
    '20:33:59.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    802,
    '2024-04-26 21:30:00',
    '20:34:39.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    803,
    '2024-04-26 21:30:00',
    '20:35:44.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    804,
    '2024-04-26 21:30:00',
    '20:35:51.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    805,
    '2024-04-26 21:30:00',
    '20:35:59.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    806,
    '2024-04-26 21:30:00',
    '20:38:32.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    807,
    '2024-04-26 21:30:00',
    '20:38:50.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    808,
    '2024-04-26 21:30:00',
    '20:38:56.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    809,
    '2024-04-26 21:30:00',
    '20:40:53.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    810,
    '2024-04-26 21:30:00',
    '20:54:28.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    811,
    '2024-04-26 21:30:00',
    '20:54:41.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    812,
    '2024-04-26 21:30:00',
    '20:54:51.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    813,
    '2024-04-26 21:30:00',
    '20:55:04.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    814,
    '2024-04-26 21:30:00',
    '20:55:09.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    815,
    '2024-04-26 21:30:00',
    '20:55:18.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    816,
    '2024-04-27 18:31:40',
    '21:01:40.000000',
    'Patient Profile',
    'Patient Profile Updated',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    817,
    '2024-04-27 18:34:12',
    '21:04:12.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    818,
    '2024-04-27 18:34:13',
    '21:04:13.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'null'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    819,
    '2024-04-27 18:40:25',
    '21:10:25.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    820,
    '2024-04-27 18:40:45',
    '21:10:45.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    821,
    '2024-04-27 18:42:00',
    '21:12:00.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    822,
    '2024-04-27 18:42:26',
    '21:12:26.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    823,
    '2024-04-27 18:55:14',
    '21:25:14.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Mobility',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    824,
    '2024-04-27 18:55:44',
    '21:25:44.000000',
    'Treatment Suggest',
    'Select Treatment : Root Canal Treatment @ per tooth for desease : Supra Erupted',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    825,
    '2024-04-27 18:59:35',
    '21:29:35.000000',
    'Secuirty Amount',
    '3300 Secuirty Amount Added',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    826,
    '2024-04-27 19:02:29',
    '21:32:29.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    827,
    '2024-04-27 19:06:25',
    '21:36:25.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    828,
    '2024-04-27 19:06:26',
    '21:36:26.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    829,
    '2024-04-27 19:06:26',
    '21:36:26.000000',
    'Treatment Procedure',
    'Digital Compuler zcd XRay (R.V.G.) Treatment Done, TPID : 79',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    830,
    '2024-04-27 19:06:26',
    '21:36:26.000000',
    'Treatment Procedure',
    'Digital Compuler zcd XRay (R.V.G.) Treatment Done, TPID : 79',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    831,
    '2024-04-27 19:09:16',
    '21:39:16.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    832,
    '2024-04-27 19:16:00',
    '21:46:00.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    NULL
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    833,
    '2024-04-27 19:16:04',
    '21:46:04.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'null'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    834,
    '2024-04-27 19:17:06',
    '21:47:06.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'null'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    835,
    '2024-04-27 19:26:11',
    '21:56:11.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'null'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    836,
    '2024-04-27 19:26:22',
    '21:56:22.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    837,
    '2024-04-27 19:34:25',
    '22:04:25.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    838,
    '2024-04-27 19:36:07',
    '22:06:07.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    839,
    '2024-04-27 19:37:56',
    '22:07:56.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    840,
    '2024-04-27 19:38:04',
    '22:08:04.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    841,
    '2024-04-27 19:38:15',
    '22:08:15.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    842,
    '2024-04-27 19:38:52',
    '22:08:52.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    843,
    '2024-04-27 19:39:33',
    '22:09:33.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    844,
    '2024-04-27 19:51:17',
    '22:21:17.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Impacted',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    845,
    '2024-04-27 19:51:34',
    '22:21:34.000000',
    'Treatment Suggest',
    'Select Treatment : Root Canal Treatment @ per tooth for desease : Fracture',
    'Madan Mahal',
    'DH_27'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    846,
    '2024-04-27 19:52:35',
    '22:22:35.000000',
    'Secuirty Amount',
    '3300 Secuirty Amount Added',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    847,
    '2024-04-27 19:54:22',
    '22:24:22.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    848,
    '2024-04-27 19:54:51',
    '22:24:51.000000',
    'Security Amount Used',
    '3300 security amount used',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    849,
    '2024-04-27 19:55:37',
    '22:25:37.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    850,
    '2024-04-27 19:55:37',
    '22:25:37.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 82',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    851,
    '2024-04-27 19:59:36',
    '22:29:36.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    852,
    '2024-04-27 19:59:40',
    '22:29:40.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    853,
    '2024-04-27 20:15:59',
    '22:45:59.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    854,
    '2024-04-27 20:24:58',
    '22:54:58.000000',
    'Examiantion',
    'Cancel Treatment',
    'Madan Mahal',
    'DH_30'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    855,
    '2024-04-27 20:25:27',
    '22:55:27.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    856,
    '2024-04-27 20:25:29',
    '22:55:29.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    857,
    '2024-04-27 20:26:11',
    '22:56:11.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    858,
    '2024-04-27 20:29:33',
    '22:59:33.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    859,
    '2024-04-27 20:30:27',
    '23:00:27.000000',
    'Treatment Suggest',
    'Select Treatment : Root Canal Treatment @ per tooth for desease : Impacted',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    860,
    '2024-04-27 20:30:46',
    '23:00:46.000000',
    'Secuirty Amount',
    '3000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    861,
    '2024-04-27 20:31:01',
    '23:01:01.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    862,
    '2024-04-27 20:31:17',
    '23:01:17.000000',
    'Security Amount Used',
    '3000 security amount used',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    863,
    '2024-04-27 20:31:43',
    '23:01:43.000000',
    'Treatment Procedure',
    'Root Canal Treatment @ per tooth Treatment Done, TPID : 83',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    864,
    '2024-04-27 20:31:53',
    '23:01:53.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    865,
    '2024-04-27 20:31:54',
    '23:01:54.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_31'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    866,
    '2024-04-29 10:49:26',
    '13:19:26.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_32'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    867,
    '2024-04-29 14:36:49',
    '17:06:49.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    868,
    '2024-04-29 16:22:36',
    '18:52:36.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    869,
    '2024-04-29 16:23:05',
    '18:53:05.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    870,
    '2024-04-29 16:23:15',
    '18:53:15.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    871,
    '2024-04-29 16:23:19',
    '18:53:19.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    872,
    '2024-04-29 16:27:19',
    '18:57:19.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    873,
    '2024-04-29 16:27:57',
    '18:57:57.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    874,
    '2024-04-29 16:28:07',
    '18:58:07.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    875,
    '2024-04-29 16:28:39',
    '18:58:39.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    876,
    '2024-04-29 16:29:03',
    '18:59:03.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    877,
    '2024-04-29 16:35:16',
    '19:05:16.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    878,
    '2024-04-29 16:35:44',
    '19:05:44.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    879,
    '2024-04-29 16:45:00',
    '19:15:00.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    880,
    '2024-04-29 16:48:35',
    '19:18:35.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    881,
    '2024-04-29 16:58:01',
    '19:28:01.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Impacted',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    882,
    '2024-04-29 16:59:56',
    '19:29:56.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    883,
    '2024-04-29 17:01:00',
    '19:31:00.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 86',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    884,
    '2024-04-29 17:18:41',
    '19:48:41.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    885,
    '2024-04-29 17:18:43',
    '19:48:43.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    886,
    '2024-04-30 12:13:19',
    '14:43:19.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    887,
    '2024-04-30 12:13:32',
    '14:43:32.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_33'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    888,
    '2024-05-02 15:34:54',
    '18:04:54.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_34'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    889,
    '2024-05-03 12:23:29',
    '14:53:29.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    890,
    '2024-05-03 12:30:45',
    '15:00:45.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    891,
    '2024-05-03 12:32:36',
    '15:02:36.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    892,
    '2024-05-03 12:32:39',
    '15:02:39.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    893,
    '2024-05-03 12:33:04',
    '15:03:04.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    894,
    '2024-05-03 12:33:37',
    '15:03:37.000000',
    'Treatment Suggest',
    'Select Treatment : Root Canal Treatment @ per tooth for desease : Caries',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    895,
    '2024-05-03 12:34:02',
    '15:04:02.000000',
    'Secuirty Amount',
    '1500 Secuirty Amount Added',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    896,
    '2024-05-03 12:34:21',
    '15:04:21.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    897,
    '2024-05-03 12:34:43',
    '15:04:43.000000',
    'Security Amount Used',
    '1500 security amount used',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    898,
    '2024-05-03 12:36:09',
    '15:06:09.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    899,
    '2024-05-03 12:36:09',
    '15:06:09.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 89',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    900,
    '2024-05-03 12:36:30',
    '15:06:30.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    901,
    '2024-05-03 12:36:33',
    '15:06:33.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    902,
    '2024-05-03 12:39:23',
    '15:09:23.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    903,
    '2024-05-03 12:39:30',
    '15:09:30.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    904,
    '2024-05-03 12:39:44',
    '15:09:44.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    905,
    '2024-05-03 12:40:35',
    '15:10:35.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    906,
    '2024-05-03 12:40:47',
    '15:10:47.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    907,
    '2024-05-03 12:40:59',
    '15:10:59.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    908,
    '2024-05-03 12:47:34',
    '15:17:34.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    909,
    '2024-05-03 12:47:35',
    '15:17:35.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 89',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    910,
    '2024-05-03 12:47:45',
    '15:17:45.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    911,
    '2024-05-03 12:50:44',
    '15:20:44.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : 89',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    912,
    '2024-05-03 12:51:46',
    '15:21:46.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    913,
    '2024-05-03 12:51:53',
    '15:21:53.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    914,
    '2024-05-03 12:52:05',
    '15:22:05.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    915,
    '2024-05-03 12:55:15',
    '15:25:15.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    916,
    '2024-05-03 12:55:25',
    '15:25:25.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    917,
    '2024-05-03 12:55:33',
    '15:25:33.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    918,
    '2024-05-03 12:56:26',
    '15:26:26.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    919,
    '2024-05-03 12:56:26',
    '15:26:26.000000',
    'Treatment Procedure',
    'Root Canal Treatment @ per tooth Treatment Done, TPID : 89',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    920,
    '2024-05-03 12:56:40',
    '15:26:40.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    921,
    '2024-05-03 12:56:44',
    '15:26:44.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    922,
    '2024-05-03 12:57:47',
    '15:27:47.000000',
    'Cancel Appointment',
    'Cancel Appointment',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    923,
    '2024-05-03 12:57:52',
    '15:27:52.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    924,
    '2024-05-03 12:57:59',
    '15:27:59.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    925,
    '2024-05-06 12:14:18',
    '14:44:18.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    926,
    '2024-05-06 12:22:39',
    '14:52:39.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    927,
    '2024-05-06 12:23:25',
    '14:53:25.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    928,
    '2024-05-06 12:23:34',
    '14:53:34.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    929,
    '2024-05-06 12:30:22',
    '15:00:22.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    930,
    '2024-05-06 12:32:26',
    '15:02:26.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    931,
    '2024-05-06 12:33:22',
    '15:03:22.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    932,
    '2024-05-06 12:36:17',
    '15:06:17.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Root Stump',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    933,
    '2024-05-06 12:37:31',
    '15:07:31.000000',
    'Treatment Suggest',
    'Select Treatment : Ceramic Braces for desease : Fracture',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    934,
    '2024-05-06 12:38:12',
    '15:08:12.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    935,
    '2024-05-06 12:40:20',
    '15:10:20.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    936,
    '2024-05-06 12:40:21',
    '15:10:21.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 90',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    937,
    '2024-05-06 12:50:18',
    '15:20:18.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    938,
    '2024-05-06 12:50:19',
    '15:20:19.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    939,
    '2024-05-06 14:16:32',
    '16:46:32.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    940,
    '2024-05-06 14:16:47',
    '16:46:47.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    941,
    '2024-05-06 14:19:28',
    '16:49:28.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    942,
    '2024-05-06 14:19:29',
    '16:49:29.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    ''
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    943,
    '2024-05-06 16:41:20',
    '19:11:20.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    944,
    '2024-05-06 16:41:40',
    '19:11:40.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_28'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    945,
    '2024-05-07 11:02:26',
    '13:32:26.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    946,
    '2024-05-07 11:02:44',
    '13:32:44.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    947,
    '2024-05-07 11:04:10',
    '13:34:10.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    948,
    '2024-05-07 11:04:33',
    '13:34:33.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    949,
    '2024-05-07 11:04:56',
    '13:34:56.000000',
    'Treatment Procedure',
    'Ceramic Braces Treatment Done, TPID : 90',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    950,
    '2024-05-07 11:06:41',
    '13:36:41.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_36'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    951,
    '2024-05-07 11:07:24',
    '13:37:24.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    952,
    '2024-05-07 11:07:30',
    '13:37:30.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    953,
    '2024-05-07 11:08:44',
    '13:38:44.000000',
    'Examiantion',
    'Cancel Treatment',
    'Madan Mahal',
    'DH_35'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    954,
    '2024-05-07 11:09:59',
    '13:39:59.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    955,
    '2024-05-07 11:10:27',
    '13:40:27.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    956,
    '2024-05-07 11:10:42',
    '13:40:42.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    957,
    '2024-05-07 11:10:50',
    '13:40:50.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    958,
    '2024-05-07 11:15:10',
    '13:45:10.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    959,
    '2024-05-07 13:12:29',
    '15:42:29.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : 92',
    'Madan Mahal',
    'DH_26'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    960,
    '2024-05-07 14:12:12',
    '16:42:12.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    961,
    '2024-05-07 14:15:11',
    '16:45:11.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    962,
    '2024-05-07 14:15:21',
    '16:45:21.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    963,
    '2024-05-07 14:15:24',
    '16:45:24.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    964,
    '2024-05-07 14:17:02',
    '16:47:02.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    965,
    '2024-05-07 14:17:46',
    '16:47:46.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Missing Tooth',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    966,
    '2024-05-07 14:18:26',
    '16:48:26.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    967,
    '2024-05-07 14:21:00',
    '16:51:00.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    968,
    '2024-05-07 14:21:01',
    '16:51:01.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 93',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    969,
    '2024-05-07 15:27:47',
    '17:57:47.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    970,
    '2024-05-08 11:11:17',
    '13:41:17.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    971,
    '2024-05-08 12:17:03',
    '14:47:03.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    972,
    '2024-05-08 12:28:11',
    '14:58:11.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    973,
    '2024-05-08 12:28:13',
    '14:58:13.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    974,
    '2024-05-08 12:28:34',
    '14:58:34.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    975,
    '2024-05-08 12:28:52',
    '14:58:52.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    976,
    '2024-05-08 12:29:14',
    '14:59:14.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Caries',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    977,
    '2024-05-08 12:29:24',
    '14:59:24.000000',
    'Treatment Suggest',
    'Select Treatment : Re-Root Canal Treatlment @ per tooth for desease : Caries',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    978,
    '2024-05-08 12:29:35',
    '14:59:35.000000',
    'Treatment Suggest',
    'Select Treatment : Ceramic Braces for desease : Fracture',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    979,
    '2024-05-08 12:29:48',
    '14:59:48.000000',
    'Treatment Suggest',
    'Select Treatment : Biopsy for desease : Fracture',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    980,
    '2024-05-08 12:30:37',
    '15:00:37.000000',
    'Secuirty Amount',
    '50000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    981,
    '2024-05-08 12:30:49',
    '15:00:49.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    982,
    '2024-05-08 12:31:10',
    '15:01:10.000000',
    'Security Amount Used',
    '540 security amount used',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    983,
    '2024-05-08 12:31:49',
    '15:01:49.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    984,
    '2024-05-08 12:31:50',
    '15:01:50.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 94',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    985,
    '2024-05-08 12:32:42',
    '15:02:42.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    986,
    '2024-05-08 12:45:26',
    '15:15:26.000000',
    'Security Amount Used',
    '540 security amount used',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    987,
    '2024-05-08 12:46:19',
    '15:16:19.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    988,
    '2024-05-08 12:46:22',
    '15:16:22.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 94',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    989,
    '2024-05-08 12:59:58',
    '15:29:58.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    990,
    '2024-05-08 12:59:59',
    '15:29:59.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    991,
    '2024-05-08 13:00:03',
    '15:30:03.000000',
    'Security Amount Used',
    '540 security amount used',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    992,
    '2024-05-08 13:00:12',
    '15:30:12.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 94',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    993,
    '2024-05-08 13:00:16',
    '15:30:16.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    994,
    '2024-05-08 16:47:08',
    '19:17:08.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    995,
    '2024-05-08 16:47:29',
    '19:17:29.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    996,
    '2024-05-08 16:47:36',
    '19:17:36.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    997,
    '2024-05-08 16:47:39',
    '19:17:39.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    998,
    '2024-05-08 16:47:52',
    '19:17:52.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    999,
    '2024-05-08 17:04:22',
    '19:34:22.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Fracture',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1000,
    '2024-05-08 17:04:51',
    '19:34:51.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1001,
    '2024-05-08 17:05:25',
    '19:35:25.000000',
    'Treatment Procedure',
    'Digital Compuler zcd XRay (R.V.G.) Treatment Done, TPID : 95',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1002,
    '2024-05-08 17:05:52',
    '19:35:52.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1003,
    '2024-05-08 17:05:56',
    '19:35:56.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1004,
    '2024-05-08 17:28:16',
    '19:58:16.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : 95',
    'Madan Mahal',
    '2'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1005,
    '2024-05-08 17:32:09',
    '20:02:09.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1006,
    '2024-05-08 17:32:40',
    '20:02:40.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1007,
    '2024-05-08 17:32:50',
    '20:02:50.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1008,
    '2024-05-08 17:34:02',
    '20:04:02.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1009,
    '2024-05-08 17:34:25',
    '20:04:25.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1010,
    '2024-05-08 17:34:33',
    '20:04:33.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1011,
    '2024-05-08 17:34:35',
    '20:04:35.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1012,
    '2024-05-08 17:34:50',
    '20:04:50.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1013,
    '2024-05-08 17:35:15',
    '20:05:15.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Caries',
    'Madan Mahal',
    'DH_25'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1014,
    '2024-05-08 21:48:57',
    '00:18:57.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1015,
    '2024-05-08 21:49:03',
    '00:19:03.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1016,
    '2024-05-08 21:49:19',
    '00:19:19.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 93',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1017,
    '2024-05-08 21:49:31',
    '00:19:31.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_29'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1018,
    '2024-05-09 11:15:52',
    '13:45:52.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1019,
    '2024-05-09 11:16:25',
    '13:46:25.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1020,
    '2024-05-09 11:16:31',
    '13:46:31.000000',
    'Security Amount Used',
    '540 security amount used',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1021,
    '2024-05-09 11:18:11',
    '13:48:11.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 94',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1022,
    '2024-05-09 11:18:26',
    '13:48:26.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1023,
    '2024-05-09 11:22:36',
    '13:52:36.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1024,
    '2024-05-09 16:29:28',
    '18:59:28.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1025,
    '2024-05-09 16:29:38',
    '18:59:38.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1026,
    '2024-05-09 18:31:26',
    '21:01:26.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1027,
    '2024-05-09 18:31:28',
    '21:01:28.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 94',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1028,
    '2024-05-09 18:33:22',
    '21:03:22.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1029,
    '2024-05-09 18:35:18',
    '21:05:18.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1030,
    '2024-05-09 18:35:25',
    '21:05:25.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1031,
    '2024-05-09 18:37:43',
    '21:07:43.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1032,
    '2024-05-09 18:37:44',
    '21:07:44.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 94',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1033,
    '2024-05-09 18:48:50',
    '21:18:50.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1034,
    '2024-05-09 18:48:51',
    '21:18:51.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 94',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1035,
    '2024-05-09 18:49:38',
    '21:19:38.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1036,
    '2024-05-09 18:52:48',
    '21:22:48.000000',
    'Edit Appointment',
    'Edit Appointment',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1037,
    '2024-05-09 18:53:52',
    '21:23:52.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 94',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1038,
    '2024-05-09 18:53:52',
    '21:23:52.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1039,
    '2024-05-09 18:53:57',
    '21:23:57.000000',
    'Cancel Appointment',
    'Cancel Appointment',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1040,
    '2024-05-09 19:44:09',
    '22:14:09.000000',
    'Cancel Appointment',
    'Cancel Appointment',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1041,
    '2024-05-10 11:39:53',
    '14:09:53.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1042,
    '2024-05-10 11:46:07',
    '14:16:07.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1043,
    '2024-05-10 12:38:30',
    '15:08:30.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1044,
    '2024-05-10 12:38:57',
    '15:08:57.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1045,
    '2024-05-10 12:45:10',
    '15:15:10.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1046,
    '2024-05-10 15:04:44',
    '17:34:44.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1047,
    '2024-05-10 15:04:50',
    '17:34:50.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1048,
    '2024-05-10 15:05:04',
    '17:35:04.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 94',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1049,
    '2024-05-10 15:05:07',
    '17:35:07.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_19'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1050,
    '2024-05-10 15:46:32',
    '18:16:32.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1051,
    '2024-05-10 15:46:34',
    '18:16:34.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1052,
    '2024-05-10 15:47:25',
    '18:17:25.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1053,
    '2024-05-10 15:47:42',
    '18:17:42.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Impacted',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1054,
    '2024-05-10 15:48:30',
    '18:18:30.000000',
    'Secuirty Amount',
    '500 Secuirty Amount Added',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1055,
    '2024-05-10 15:50:23',
    '18:20:23.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1056,
    '2024-05-10 15:50:24',
    '18:20:24.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1057,
    '2024-05-10 15:50:52',
    '18:20:52.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1058,
    '2024-05-10 15:51:14',
    '18:21:14.000000',
    'Treatment Suggest',
    'Select Treatment : Indirect Pulp Capping @ per tooth for desease : Fracture',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1059,
    '2024-05-10 15:51:23',
    '18:21:23.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1060,
    '2024-05-10 15:51:42',
    '18:21:42.000000',
    'Treatment Procedure',
    'Indirect Pulp Capping @ per tooth Treatment Done, TPID : 98',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1061,
    '2024-05-10 15:51:51',
    '18:21:51.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1062,
    '2024-05-10 15:51:56',
    '18:21:56.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1063,
    '2024-05-10 15:52:15',
    '18:22:15.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : 98',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1064,
    '2024-05-10 15:59:30',
    '18:29:30.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1065,
    '2024-05-10 15:59:43',
    '18:29:43.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1066,
    '2024-05-10 15:59:57',
    '18:29:57.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1067,
    '2024-05-10 16:06:05',
    '18:36:05.000000',
    'Treatment Suggest',
    'Select Treatment : Pulpectomy (Child) @ per tooth for desease : Missing Tooth',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1068,
    '2024-05-10 16:07:59',
    '18:37:59.000000',
    'Secuirty Amount',
    '2800 Secuirty Amount Added',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1069,
    '2024-05-10 17:01:26',
    '19:31:26.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1070,
    '2024-05-10 17:11:27',
    '19:41:27.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1071,
    '2024-05-10 17:32:06',
    '20:02:06.000000',
    'Cancel Appointment',
    'Cancel Appointment',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1072,
    '2024-05-10 17:32:51',
    '20:02:51.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1073,
    '2024-05-10 21:03:45',
    '23:33:45.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1074,
    '2024-05-10 21:04:24',
    '23:34:24.000000',
    'Edit Appointment',
    'Edit Appointment',
    'Madan Mahal',
    'DH_15'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1075,
    '2024-05-10 21:04:59',
    '23:34:59.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_14'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1076,
    '2024-05-10 21:21:37',
    '23:51:37.000000',
    'Edit Appointment',
    'Edit Appointment',
    'Madan Mahal',
    '123456'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1077,
    '2024-05-11 12:37:43',
    '15:07:43.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1078,
    '2024-05-11 12:39:39',
    '15:09:39.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1079,
    '2024-05-11 12:39:57',
    '15:09:57.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1080,
    '2024-05-11 12:40:11',
    '15:10:11.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1081,
    '2024-05-11 12:40:50',
    '15:10:50.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1082,
    '2024-05-11 12:41:16',
    '15:11:16.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1083,
    '2024-05-11 12:42:05',
    '15:12:05.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1084,
    '2024-05-11 12:42:36',
    '15:12:36.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1085,
    '2024-05-11 12:43:00',
    '15:13:00.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1086,
    '2024-05-11 12:43:51',
    '15:13:51.000000',
    'Treatment Suggest',
    'Select Treatment : Third Molar /Impacted Tooth Removal for desease : Fracture',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1087,
    '2024-05-11 12:44:47',
    '15:14:47.000000',
    'Secuirty Amount',
    '2000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1088,
    '2024-05-11 12:46:06',
    '15:16:06.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1089,
    '2024-05-11 12:46:28',
    '15:16:28.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1090,
    '2024-05-11 12:47:07',
    '15:17:07.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1091,
    '2024-05-11 12:48:16',
    '15:18:16.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1092,
    '2024-05-11 12:48:19',
    '15:18:19.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1093,
    '2024-05-11 12:48:34',
    '15:18:34.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1094,
    '2024-05-11 12:48:57',
    '15:18:57.000000',
    'Treatment Suggest',
    'Select Treatment : Root Canal Treatment @ per tooth for desease : Caries',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1095,
    '2024-05-11 12:49:21',
    '15:19:21.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1096,
    '2024-05-11 12:50:17',
    '15:20:17.000000',
    'Secuirty Amount',
    '1000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1097,
    '2024-05-11 12:50:33',
    '15:20:33.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1098,
    '2024-05-11 12:51:28',
    '15:21:28.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1099,
    '2024-05-11 12:51:29',
    '15:21:29.000000',
    'Treatment Procedure',
    'Root Canal Treatment @ per tooth Treatment Done, TPID : 101',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1100,
    '2024-05-11 12:51:42',
    '15:21:42.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1101,
    '2024-05-11 12:54:10',
    '15:24:10.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1102,
    '2024-05-11 12:54:26',
    '15:24:26.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1103,
    '2024-05-11 12:55:07',
    '15:25:07.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_38'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1104,
    '2024-05-11 12:56:49',
    '15:26:49.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1105,
    '2024-05-11 12:57:01',
    '15:27:01.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1106,
    '2024-05-11 12:57:03',
    '15:27:03.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1107,
    '2024-05-11 12:57:16',
    '15:27:16.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1108,
    '2024-05-11 12:57:42',
    '15:27:42.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1109,
    '2024-05-11 12:58:28',
    '15:28:28.000000',
    'Treatment Suggest',
    'Select Treatment : Ceramic Braces for desease : Caries',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1110,
    '2024-05-11 12:58:49',
    '15:28:49.000000',
    'Treatment Suggest',
    'Select Treatment : Porcelain Fused to Metal @ per Crown for desease : Missing Tooth',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1111,
    '2024-05-11 13:00:19',
    '15:30:19.000000',
    'Secuirty Amount',
    '40000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1112,
    '2024-05-11 13:01:29',
    '15:31:29.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : 102',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1113,
    '2024-05-11 13:01:47',
    '15:31:47.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1114,
    '2024-05-11 13:02:12',
    '15:32:12.000000',
    'Security Amount Used',
    '40000 security amount used',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1115,
    '2024-05-11 13:03:23',
    '15:33:23.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1116,
    '2024-05-11 13:03:24',
    '15:33:24.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 102',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1117,
    '2024-05-11 13:03:38',
    '15:33:38.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1118,
    '2024-05-11 13:03:51',
    '15:33:51.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1119,
    '2024-05-11 13:04:15',
    '15:34:15.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1120,
    '2024-05-11 13:04:25',
    '15:34:25.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1121,
    '2024-05-11 13:06:50',
    '15:36:50.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1122,
    '2024-05-11 13:07:12',
    '15:37:12.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1123,
    '2024-05-11 13:07:30',
    '15:37:30.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1124,
    '2024-05-11 13:08:26',
    '15:38:26.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_39'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1125,
    '2024-05-11 13:25:28',
    '15:55:28.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1126,
    '2024-05-11 15:39:01',
    '18:09:01.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1127,
    '2024-05-11 15:39:25',
    '18:09:25.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1128,
    '2024-05-11 15:40:25',
    '18:10:25.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1129,
    '2024-05-11 15:40:36',
    '18:10:36.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1130,
    '2024-05-11 15:40:40',
    '18:10:40.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1131,
    '2024-05-11 15:41:43',
    '18:11:43.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1132,
    '2024-05-11 15:42:00',
    '18:12:00.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1133,
    '2024-05-11 15:43:09',
    '18:13:09.000000',
    'Treatment Suggest',
    'Select Treatment : Metal Braces for desease : Caries',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1134,
    '2024-05-11 15:44:28',
    '18:14:28.000000',
    'Secuirty Amount',
    '25000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1135,
    '2024-05-11 15:45:13',
    '18:15:13.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1136,
    '2024-05-11 15:45:13',
    '18:15:13.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1137,
    '2024-05-11 15:45:41',
    '18:15:41.000000',
    'Security Amount Used',
    '20000 security amount used',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1138,
    '2024-05-11 15:46:26',
    '18:16:26.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1139,
    '2024-05-11 15:46:26',
    '18:16:26.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 103',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1140,
    '2024-05-11 15:46:54',
    '18:16:54.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1141,
    '2024-05-11 15:53:18',
    '18:23:18.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1142,
    '2024-05-11 15:53:29',
    '18:23:29.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1143,
    '2024-05-11 15:54:10',
    '18:24:10.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1144,
    '2024-05-11 15:54:13',
    '18:24:13.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1145,
    '2024-05-11 15:55:09',
    '18:25:09.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1146,
    '2024-05-11 15:55:37',
    '18:25:37.000000',
    'Treatment Procedure',
    'Metal Braces Treatment Done, TPID : 103',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1147,
    '2024-05-11 15:55:55',
    '18:25:55.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1148,
    '2024-05-11 15:55:58',
    '18:25:58.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_41'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1149,
    '2024-05-11 16:19:15',
    '18:49:15.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1150,
    '2024-05-11 16:20:19',
    '18:50:19.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1151,
    '2024-05-11 16:23:27',
    '18:53:27.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1152,
    '2024-05-11 16:23:31',
    '18:53:31.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1153,
    '2024-05-11 19:14:41',
    '21:44:41.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1154,
    '2024-05-11 19:14:43',
    '21:44:43.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1155,
    '2024-05-11 19:16:31',
    '21:46:31.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1156,
    '2024-05-11 19:16:34',
    '21:46:34.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1157,
    '2024-05-11 19:16:51',
    '21:46:51.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1158,
    '2024-05-11 19:17:22',
    '21:47:22.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Caries',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1159,
    '2024-05-11 19:17:52',
    '21:47:52.000000',
    'Secuirty Amount',
    '200 Secuirty Amount Added',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1160,
    '2024-05-11 19:18:12',
    '21:48:12.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1161,
    '2024-05-11 19:18:28',
    '21:48:28.000000',
    'Security Amount Used',
    '200 security amount used',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1162,
    '2024-05-11 19:18:39',
    '21:48:39.000000',
    'Treatment Procedure',
    'Digital Compuler zcd XRay (R.V.G.) Treatment Done, TPID : 107',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1163,
    '2024-05-11 19:18:58',
    '21:48:58.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1164,
    '2024-05-11 19:19:32',
    '21:49:32.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : 107',
    'Madan Mahal',
    'DH_40'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1165,
    '2024-05-11 19:30:50',
    '22:00:50.000000',
    'Add Patient',
    'Add Patient and Appointment scheduled',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1166,
    '2024-05-11 19:31:14',
    '22:01:14.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1167,
    '2024-05-11 19:31:19',
    '22:01:19.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1168,
    '2024-05-11 19:31:21',
    '22:01:21.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1169,
    '2024-05-11 19:31:38',
    '22:01:38.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1170,
    '2024-05-11 19:32:16',
    '22:02:16.000000',
    'Treatment Suggest',
    'Select Treatment : Porcelain Fused to Metal @ per Crown for desease : Mobility',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1171,
    '2024-05-11 19:33:14',
    '22:03:14.000000',
    'Secuirty Amount',
    '2000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1172,
    '2024-05-11 19:33:29',
    '22:03:29.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1173,
    '2024-05-11 19:33:36',
    '22:03:36.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_14'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1174,
    '2024-05-11 19:33:46',
    '22:03:46.000000',
    'Security Amount Used',
    '2000 security amount used',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1175,
    '2024-05-11 19:35:40',
    '22:05:40.000000',
    'Treatment Procedure',
    'Porcelain Fused to Metal @ per Crown Treatment Done, TPID : 108',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1176,
    '2024-05-11 19:35:48',
    '22:05:48.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1177,
    '2024-05-11 19:41:00',
    '22:11:00.000000',
    'Final Bill Generation',
    'Final Bill Generated for TPID : 108',
    'Madan Mahal',
    'DH_42'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1178,
    '2024-05-11 19:50:15',
    '22:20:15.000000',
    'Appointment',
    'Appointment scheduled',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1179,
    '2024-05-11 19:50:44',
    '22:20:44.000000',
    'Appointment',
    'Patient Check-In',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1180,
    '2024-05-11 19:51:22',
    '22:21:22.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1181,
    '2024-05-11 19:51:24',
    '22:21:24.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1182,
    '2024-05-11 19:51:42',
    '22:21:42.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1183,
    '2024-05-11 21:24:27',
    '23:54:27.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_14'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1184,
    '2024-05-11 21:24:44',
    '23:54:44.000000',
    'Examiantion',
    'Selected Category Dental-X',
    'Madan Mahal',
    'DH_14'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1185,
    '2024-05-11 21:25:55',
    '23:55:55.000000',
    'Examiantion',
    'Add Teeth DentalX',
    'Madan Mahal',
    'DH_14'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1186,
    '2024-05-13 14:46:54',
    '17:16:54.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1187,
    '2024-05-13 14:47:05',
    '17:17:05.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1188,
    '2024-05-13 14:47:21',
    '17:17:21.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1189,
    '2024-05-13 14:47:39',
    '17:17:39.000000',
    'Treatment Suggest',
    'Select Treatment : Digital Compuler zcd XRay (R.V.G.) for desease : Caries',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1190,
    '2024-05-13 14:48:06',
    '17:18:06.000000',
    'Secuirty Amount',
    '1000 Secuirty Amount Added',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1191,
    '2024-05-13 14:48:46',
    '17:18:46.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1192,
    '2024-05-13 14:49:12',
    '17:19:12.000000',
    'Security Amount Used',
    '270 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1193,
    '2024-05-13 14:49:29',
    '17:19:29.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 111',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1194,
    '2024-05-13 14:50:16',
    '17:20:16.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1195,
    '2024-05-13 14:50:33',
    '17:20:33.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1196,
    '2024-05-13 15:08:05',
    '17:38:05.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1197,
    '2024-05-13 15:08:32',
    '17:38:32.000000',
    'Medical Prescription',
    'Medicine Added Successfully',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1198,
    '2024-05-13 15:55:03',
    '18:25:03.000000',
    'Bill Data',
    'Bill Generated for the sitting',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1199,
    '2024-05-13 15:55:53',
    '18:25:53.000000',
    'Examiantion',
    'Selected Category Pediatric',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1200,
    '2024-05-13 15:56:24',
    '18:26:24.000000',
    'Examiantion',
    'Add Teeth Pediatric DentalX',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1201,
    '2024-05-13 16:04:20',
    '18:34:20.000000',
    'Treatment Suggest',
    'Select Treatment : Root Canal Treatment @ per tooth for desease : Fracture',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1202,
    '2024-05-13 16:26:19',
    '18:56:19.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1203,
    '2024-05-13 17:35:48',
    '20:05:48.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 111',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1204,
    '2024-05-13 17:39:25',
    '20:09:25.000000',
    'Security Amount Used',
    '270 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1205,
    '2024-05-13 17:46:18',
    '20:16:18.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 111',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1206,
    '2024-05-13 17:54:19',
    '20:24:19.000000',
    'Security Amount Used',
    '270 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1207,
    '2024-05-13 17:57:36',
    '20:27:36.000000',
    'Security Amount Used',
    '270 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1208,
    '2024-05-13 18:04:58',
    '20:34:58.000000',
    'Security Amount Used',
    '270 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1209,
    '2024-05-13 18:07:13',
    '20:37:13.000000',
    'Security Amount Used',
    '270 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1210,
    '2024-05-13 18:12:57',
    '20:42:57.000000',
    'Security Amount Used',
    '270 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1211,
    '2024-05-13 19:43:28',
    '22:13:28.000000',
    'Security Amount Used',
    '100 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1212,
    '2024-05-13 19:44:34',
    '22:14:34.000000',
    'Security Amount Used',
    '100 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1213,
    '2024-05-13 19:44:52',
    '22:14:52.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 111',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1214,
    '2024-05-13 19:50:41',
    '22:20:41.000000',
    'Security Amount Used',
    '100 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1215,
    '2024-05-13 19:50:47',
    '22:20:47.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 111',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1216,
    '2024-05-13 19:55:55',
    '22:25:55.000000',
    'Security Amount Used',
    '100 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1217,
    '2024-05-13 19:55:59',
    '22:25:59.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 111',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1218,
    '2024-05-13 19:57:35',
    '22:27:35.000000',
    'Security Amount Used',
    '270 security amount used',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1219,
    '2024-05-13 19:59:47',
    '22:29:47.000000',
    'Book Sitting Appointment',
    'Book Sitting Appointment',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1220,
    '2024-05-13 19:59:47',
    '22:29:47.000000',
    'Treatment Procedure',
    'Sitting Done, TPID : 111',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1221,
    '2024-05-13 20:03:00',
    '22:33:00.000000',
    'Examiantion',
    'Start Examintion',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1222,
    '2024-05-13 20:07:24',
    '22:37:24.000000',
    'Sitting Considered',
    '1 Sitting Started',
    'Madan Mahal',
    'DH_37'
  );
INSERT INTO
  `patient_timeline` (
    `event_id`,
    `event_date`,
    `event_time`,
    `event_type`,
    `event_description`,
    `branch_name`,
    `uhid`
  )
VALUES
  (
    1223,
    '2024-05-13 20:08:07',
    '22:38:07.000000',
    'Sitting Considered',
    '2 Sitting Started',
    'Madan Mahal',
    'DH_37'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: payment_details
# ------------------------------------------------------------

INSERT INTO
  `payment_details` (
    `pay_id`,
    `bill_id`,
    `uhid`,
    `branch_name`,
    `bill_amount`,
    `paid_amount`,
    `pending_amount`,
    `billed_service`,
    `payment_mode`,
    `payment_status`,
    `payment_date`,
    `payment_time`
  )
VALUES
  (
    1,
    1,
    'DH0001',
    'Madan Mahal',
    900,
    800,
    100,
    'Dental Cleanings',
    'Online',
    'success',
    '2024-03-03',
    '15:54:00.000000'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: prescription_details
# ------------------------------------------------------------

INSERT INTO
  `prescription_details` (
    `prescription_id`,
    `branch_name`,
    `uhid`,
    `doctor_id`,
    `doctor_name`,
    `medicine_name`,
    `dosage`,
    `frequency`,
    `duration`,
    `note`,
    `prescription_date`
  )
VALUES
  (
    1,
    'Madan Mahal',
    'DH0001',
    'dg_1',
    'umer',
    'Disprin 325 tablet',
    '10',
    '1-1-1',
    '1',
    'sone ke baad',
    '2024-03-04'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: purchase_inventory
# ------------------------------------------------------------

INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    1,
    'Disprin 325 tablet',
    'drugs',
    '200',
    '3004',
    '3004',
    10,
    '',
    '2000',
    'Madan Mahal',
    50,
    20,
    'Virumal',
    '8602161019',
    'http://localhost:7777/reciept_doc/1709191637374kd.jpg',
    '2024-05-02'
  );
INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    2,
    'Disprin 325 tablet',
    'drugs',
    '200',
    '3004',
    '3004',
    10,
    '',
    '2000',
    'Madan Mahal',
    50,
    10,
    'Virumal',
    '8602161019',
    NULL,
    '2024-02-26'
  );
INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    3,
    'Disprin 325 tablet',
    'true',
    '300',
    '3005',
    '3005',
    20,
    '500',
    '5500',
    'Madan Mahal',
    20,
    10,
    'Virumal',
    '8602161019',
    'http://localhost:7777/reciept_doc/1709210553720Bigbulls Course.png',
    '2024-03-05'
  );
INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    4,
    'Disprin 350 tablet',
    'drugs',
    '200',
    '3006',
    '3006',
    20,
    '200',
    '3800',
    'Madan Mahal',
    20,
    10,
    'virumal',
    '8602161019',
    'http://localhost:7777/reciept_doc/1709191637374kd.jpg',
    '2024-02-29'
  );
INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    8,
    'Disprin 500 tablet',
    'Drug',
    '500',
    '3008',
    '3008',
    28,
    '500',
    '14000',
    'Madan Mahal',
    28,
    5,
    'virumal',
    '8602161019',
    'http://localhost:7777/reciept_doc/1709355700796kd.jpg',
    '2024-03-02'
  );
INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    10,
    'Disprin 400 tablet',
    'drug',
    '200',
    '3007',
    '3007',
    10,
    '',
    '2000',
    'Madan Mahal',
    50,
    10,
    'Virumal',
    '8602161019',
    'http://localhost:https://dentalgurusuperadmin.doaguru.com/reciept_doc/1710060533673Bigbulls Course.png',
    '0000-00-00'
  );
INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    11,
    'Disprin 400 tablet',
    'drug',
    '200',
    '3009',
    '3009',
    10,
    '',
    '2000',
    'Madan Mahal',
    50,
    10,
    'Virumal',
    '8602161019',
    'http://localhost:https://dentalgurusuperadmin.doaguru.com/reciept_doc/1710060654402Bigbulls Course.png',
    '0000-00-00'
  );
INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    12,
    'Disprin 400 tablet',
    'drug',
    '200',
    '3010',
    '3010',
    10,
    '',
    '2000',
    'Madan Mahal',
    50,
    10,
    'Virumal',
    '8602161019',
    'http://localhost:https://dentalgurusuperadmin.doaguru.com/reciept_doc/1710060711681Bigbulls Course.png',
    '0000-00-00'
  );
INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    13,
    'Disprin 400 tablet',
    'drug',
    '200',
    '3011',
    '3011',
    10,
    '',
    '2000',
    'Madan Mahal',
    50,
    10,
    'Virumal',
    '8602161019',
    'https://dentalgurusuperadmin.doaguru.com/reciept_doc/1710060776147Bigbulls Course.png',
    '0000-00-00'
  );
INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    14,
    'Disprin 400 tablet',
    'drug',
    '200',
    '3012',
    '3012',
    10,
    '',
    '2000',
    'Madan Mahal',
    50,
    10,
    'Virumal',
    '8602161019',
    'https://dentalgurusuperadmin.doaguru.com/reciept_doc/1710060815049Bigbulls Course.png',
    '0000-00-00'
  );
INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    21,
    'test',
    'drug',
    '200',
    '3017',
    '3017',
    10,
    '',
    '2000',
    'Madan Mahal',
    50,
    10,
    'Virumal',
    '8602161019',
    'https://dentalgurusuperadmin.doaguru.com/reciept_doc/17149865245531709210206279kd.jpg',
    '0000-00-00'
  );
INSERT INTO
  `purchase_inventory` (
    `pur_id`,
    `item_name`,
    `item_category`,
    `item_mrp`,
    `item_code`,
    `HSN_code`,
    `pur_quantity`,
    `discount`,
    `total_amount`,
    `branch_name`,
    `available_stock`,
    `low_stock_threshhold`,
    `distributor_name`,
    `distributor_number`,
    `bill_receipt_doc`,
    `purchase_date`
  )
VALUES
  (
    22,
    'testone',
    'drug',
    '100',
    '3019',
    '3019',
    10,
    '0',
    '1000',
    'Madan Mahal',
    10,
    10,
    'testone',
    '9999999999',
    'https://dentalgurusuperadmin.doaguru.com/reciept_doc/17149866959631709210206279kd.jpg',
    '2024-05-09'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: security_amount
# ------------------------------------------------------------

INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    1,
    '30',
    'Madan Mahal',
    '2024-04-24 15:09:30',
    12,
    '123456',
    'Vinay Johnson',
    '7890123456',
    '',
    'shadab',
    7500,
    0,
    'Refunded',
    'cash',
    '',
    '2024-04-24 17:33:00.290',
    'afqafs',
    500,
    '2024-04-24 09:39:27.088000',
    'kuldeepdoauruinfosystems@gmail.com',
    'kuldeepdoauruinfosystems@gmail.com'
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    3,
    '39',
    'Madan Mahal',
    '2024-04-24 16:33:38',
    32,
    '123456',
    'mohit',
    '2222222223',
    '',
    'shadab',
    4100,
    0,
    'Success',
    'online',
    '4555465444454',
    '2024-04-24',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    4,
    '42',
    'Madan Mahal',
    '2024-04-25 11:34:33',
    23,
    '123456',
    'mohit',
    '2222222223',
    '',
    'shadab',
    2500,
    0,
    'Refunded',
    'cash',
    '',
    '2024-04-24',
    NULL,
    125,
    '2024-04-25 06:01:08.869000',
    'shadab',
    'shadab'
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    5,
    '43',
    'Madan Mahal',
    '2024-04-26 18:59:09',
    50,
    'DH_21',
    'soni ji',
    '2154879231',
    '',
    'shadab',
    1000,
    0,
    'Refunded',
    'cash',
    '',
    '2024-04-24 22:15:25.518',
    'test',
    1000,
    '2024-04-26 13:29:07.182000',
    'shadab',
    'kuldeepdoauruinfosystems@gmail.com'
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    6,
    '45',
    'Madan Mahal',
    '2024-04-25 11:35:29',
    54,
    'DH_23',
    'yadav ji',
    '8989898989',
    '',
    'shadab',
    4000,
    4000,
    'Success',
    'cash',
    '',
    '2024-04-25 14:05:29.481',
    'bjgdg',
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    7,
    '46',
    'Madan Mahal',
    '2024-04-25 14:52:16',
    30,
    '123456',
    'mohit',
    '2222222223',
    '',
    'shadab',
    3000,
    3000,
    'Success',
    'online',
    '123',
    '2024-04-25 17:22:16.819',
    'some note',
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    8,
    '53',
    'Madan Mahal',
    '2024-04-25 15:11:52',
    47,
    'DH_20',
    'priyanshu',
    '8989865656',
    '',
    'shadab',
    300,
    300,
    'Success',
    'online',
    '456',
    '2024-04-25 17:41:52.621',
    '456',
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    9,
    '57',
    'Madan Mahal',
    '2024-04-25 15:12:52',
    59,
    'DH_20',
    'priyanshu',
    '8989865656',
    '',
    'shadab',
    300,
    0,
    'Refunded',
    'online',
    '1234',
    '2024-04-25 17:41:34.113',
    '1234',
    300,
    '2024-04-25 09:42:36.893000',
    'shadab',
    'shadab'
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    10,
    '63',
    'Madan Mahal',
    '2024-04-25 15:22:33',
    59,
    'DH_20',
    'priyanshu',
    '8989865656',
    '',
    'shadab',
    8000,
    5000,
    'success',
    'cash',
    '',
    '2024-04-25',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    11,
    '65',
    'Madan Mahal',
    '2024-04-25 16:25:36',
    61,
    'DH_12',
    'dev',
    '1236547890',
    '',
    'shadab',
    7600,
    7600,
    'Success',
    'cash',
    '',
    '2024-04-25 18:51:39.485',
    'some note',
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    12,
    '67',
    'Madan Mahal',
    '2024-04-25 18:55:47',
    62,
    'DH_26',
    'nishi',
    '8956496595',
    '',
    'shadab',
    500,
    200,
    'success',
    'cash',
    '',
    '2024-04-25',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    13,
    '68',
    'Madan Mahal',
    '2024-04-26 19:02:00',
    36,
    '123456',
    'mohit',
    '2222222223',
    '',
    'shadab',
    200,
    0,
    'Refunded',
    'cash',
    '',
    '2024-04-26',
    NULL,
    200,
    '2024-04-26 13:31:59.450000',
    'shadab',
    'kuldeepdoauruinfosystems@gmail.com'
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    14,
    '70',
    'Madan Mahal',
    '2024-05-10 15:29:54',
    36,
    '123456',
    'mohit',
    '2222222223',
    '',
    'shadab',
    3000,
    0,
    'Refunded',
    'cash',
    '141411',
    '',
    NULL,
    600,
    '2024-05-10 09:59:49.421000',
    'shadab',
    'shadab'
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    15,
    '71',
    'Madan Mahal',
    '2024-04-27 15:22:00',
    64,
    'DH_27',
    'vinay2',
    '9198900449',
    '',
    'shadab',
    2000,
    NULL,
    'Success',
    'cash',
    '',
    '2024-04-27 17:52:00.224',
    'received',
    NULL,
    NULL,
    'kuldeepdoauruinfosystems@gmail.com',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    16,
    '74',
    'Madan Mahal',
    '2024-04-27 15:21:05',
    48,
    '123456',
    'mohit',
    '2222222223',
    '',
    'shadab',
    2000,
    NULL,
    'pending',
    'online',
    '112222',
    '2024-04-27 17:48:43.106',
    '9988',
    NULL,
    NULL,
    'kuldeepdoauruinfosystems@gmail.com',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    17,
    '75',
    'Madan Mahal',
    '2024-04-27 15:50:53',
    65,
    'DH_27',
    'vinay2',
    '9198900449',
    '',
    'shadab',
    300,
    0,
    'success',
    'cash',
    '',
    '2024-04-27',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    18,
    '79',
    'Madan Mahal',
    '2024-05-10 18:17:56',
    71,
    'DH_28',
    'khan shahab',
    '5656656565',
    '',
    'shadab',
    3300,
    0,
    'Refunded',
    'cash',
    '',
    '2024-05-10 18:00:19.178',
    'no',
    3300,
    '2024-05-10 12:47:50.158000',
    'shadab',
    'shadab'
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    19,
    '82',
    'Madan Mahal',
    '2024-04-27 19:54:51',
    75,
    'DH_30',
    'umer first',
    '8989896656',
    '',
    'shadab',
    3300,
    0,
    'Success',
    'cash',
    '',
    '2024-04-27 22:23:51.737',
    'ok',
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    20,
    '83',
    'Madan Mahal',
    '2024-04-27 20:31:17',
    76,
    'DH_31',
    'umer second',
    '8965734659',
    '',
    'shadab',
    3000,
    0,
    'success',
    'cash',
    '',
    '2024-04-27',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    21,
    '89',
    'Madan Mahal',
    '2024-05-03 12:34:43',
    81,
    'DH_35',
    'nishi',
    '1234567890',
    '',
    'shadab',
    1500,
    0,
    'success',
    'cash',
    '',
    '2024-05-03',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    22,
    '94',
    'Madan Mahal',
    '2024-05-09 11:16:30',
    93,
    'DH_19',
    'dev',
    '1232254855',
    '',
    'shadab',
    50000,
    47840,
    'success',
    'cash',
    '',
    '2024-05-08',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    23,
    '97',
    'Madan Mahal',
    '2024-05-10 15:48:30',
    108,
    'DH_15',
    'mohit',
    '9806656568',
    '',
    'shadab',
    500,
    500,
    'success',
    'cash',
    '',
    '2024-05-10',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    24,
    '99',
    'Madan Mahal',
    '2024-05-10 16:07:58',
    108,
    'DH_15',
    'mohit',
    '9806656568',
    '',
    'shadab',
    2800,
    2800,
    'success',
    'cash',
    '',
    '2024-05-10',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    25,
    '100',
    'Madan Mahal',
    '2024-05-11 12:45:44',
    115,
    'DH_38',
    'subham soni',
    '1456214567',
    '',
    'shadab',
    1000,
    1000,
    'success',
    'cash',
    'csdcdscsdczs',
    '2024-05-11',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    26,
    '101',
    'Madan Mahal',
    '2024-05-11 12:50:16',
    115,
    'DH_38',
    'subham soni',
    '1456214567',
    '',
    'shadab',
    1000,
    1000,
    'success',
    'online',
    'EWFFC',
    '2024-05-11',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    27,
    '102',
    'Madan Mahal',
    '2024-05-11 13:02:11',
    116,
    'DH_39',
    'DEV',
    '1545648676',
    '',
    'shadab',
    40000,
    0,
    'Success',
    'online',
    'ZXCDS',
    '2024-05-11 15:31:11.575',
    'VD',
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    28,
    '103',
    'Madan Mahal',
    '2024-05-11 15:45:40',
    120,
    'DH_41',
    'mohit ',
    '2165486432',
    '',
    'shadab',
    20000,
    0,
    'success',
    'cash',
    'csdcdscsdczs',
    '2024-05-11',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    29,
    '107',
    'Madan Mahal',
    '2024-05-11 19:18:28',
    119,
    'DH_40',
    'UMER',
    '5356132165',
    '',
    'shadab',
    200,
    0,
    'success',
    'cash',
    '',
    '2024-05-11',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    30,
    '108',
    'Madan Mahal',
    '2024-05-11 19:33:45',
    122,
    'DH_42',
    'gautam',
    '3247845128',
    '',
    'shadab',
    2000,
    0,
    'success',
    'online',
    'csdcdscsdczs',
    '2024-05-11',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );
INSERT INTO
  `security_amount` (
    `sa_id`,
    `tp_id`,
    `branch_name`,
    `date`,
    `appointment_id`,
    `uhid`,
    `patient_name`,
    `patient_number`,
    `treatment`,
    `assigned_doctor`,
    `amount`,
    `remaining_amount`,
    `payment_status`,
    `payment_Mode`,
    `transaction_Id`,
    `payment_date`,
    `notes`,
    `refund_amount`,
    `refund_date`,
    `received_by`,
    `refund_by`
  )
VALUES
  (
    31,
    '111',
    'Madan Mahal',
    '2024-05-13 19:57:34',
    123,
    'DH_37',
    'vinaydhariya',
    '9198900449',
    '',
    'shadab',
    2000,
    790,
    'success',
    'cash',
    '',
    '2024-05-13',
    NULL,
    NULL,
    NULL,
    'shadab',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: staff_salary
# ------------------------------------------------------------

INSERT INTO
  `staff_salary` (
    `sl_id`,
    `employee_ID`,
    `branch_name`,
    `payable_salary`,
    `paid_salary`,
    `due_salary`,
    `advance_payment`,
    `pay_date`,
    `pay_status`,
    `pay_month`
  )
VALUES
  (
    1,
    'dg_1',
    'Madan Mahal',
    '20000',
    '18000',
    '2000',
    '',
    '2024-04-10 14:00:00.000000',
    '',
    'March 2024'
  );
INSERT INTO
  `staff_salary` (
    `sl_id`,
    `employee_ID`,
    `branch_name`,
    `payable_salary`,
    `paid_salary`,
    `due_salary`,
    `advance_payment`,
    `pay_date`,
    `pay_status`,
    `pay_month`
  )
VALUES
  (
    2,
    'dg_1',
    'Madan Mahal',
    '20000',
    '18000',
    '2000',
    '',
    '2024-04-10 14:00:00.000000',
    '',
    'March 2024'
  );
INSERT INTO
  `staff_salary` (
    `sl_id`,
    `employee_ID`,
    `branch_name`,
    `payable_salary`,
    `paid_salary`,
    `due_salary`,
    `advance_payment`,
    `pay_date`,
    `pay_status`,
    `pay_month`
  )
VALUES
  (
    3,
    'dg_2',
    'Madan Mahal',
    '20000',
    '18000',
    '2000',
    '',
    '2024-04-10 14:00:00.000000',
    '',
    'March 2024'
  );
INSERT INTO
  `staff_salary` (
    `sl_id`,
    `employee_ID`,
    `branch_name`,
    `payable_salary`,
    `paid_salary`,
    `due_salary`,
    `advance_payment`,
    `pay_date`,
    `pay_status`,
    `pay_month`
  )
VALUES
  (
    4,
    'dg_5',
    'Madan Mahal',
    '20000',
    '18000',
    '2000',
    '',
    '2024-04-10 14:00:00.000000',
    'success',
    'March'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: super_admin
# ------------------------------------------------------------

INSERT INTO
  `super_admin` (
    `sa_id`,
    `hospital_id`,
    `hospital_name`,
    `super_name`,
    `super_email`,
    `super_mobile`,
    `super_password`
  )
VALUES
  (
    1,
    'hos_1',
    'dental square',
    'mohit sahu',
    'kuldeepdoauruinfosystems@gmail.com',
    '8602161019',
    '$2a$10$AvonBlGGaSAPdoNBBcL9V.WfytnSOwRsd4Zclqqd6gs0CcdMW34i6'
  );
INSERT INTO
  `super_admin` (
    `sa_id`,
    `hospital_id`,
    `hospital_name`,
    `super_name`,
    `super_email`,
    `super_mobile`,
    `super_password`
  )
VALUES
  (
    2,
    'hos_1',
    'dental square',
    'mohit sahu',
    'vinaydhariya21@gmail.com',
    '8602161019',
    '$2a$10$dkgBpGckBIfSWJxsTTneyuxaVR.OIkyP.RWFDS0x.ZOY6XqBMk/Pm'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: treat_procedure_list
# ------------------------------------------------------------

INSERT INTO
  `treat_procedure_list` (`treat_procedure_id`, `treat_procedure_name`)
VALUES
  (2, 'Dental IOPA X Ray');
INSERT INTO
  `treat_procedure_list` (`treat_procedure_id`, `treat_procedure_name`)
VALUES
  (3, 'Endodontlc Procedures');
INSERT INTO
  `treat_procedure_list` (`treat_procedure_id`, `treat_procedure_name`)
VALUES
  (4, 'Restorative & Cosmetic Procedures');
INSERT INTO
  `treat_procedure_list` (`treat_procedure_id`, `treat_procedure_name`)
VALUES
  (5, 'Prosthetic Procedures');
INSERT INTO
  `treat_procedure_list` (`treat_procedure_id`, `treat_procedure_name`)
VALUES
  (6, 'Orthodentics (Braces) Procedures');
INSERT INTO
  `treat_procedure_list` (`treat_procedure_id`, `treat_procedure_name`)
VALUES
  (7, 'Oral Surgery Procedures');
INSERT INTO
  `treat_procedure_list` (`treat_procedure_id`, `treat_procedure_name`)
VALUES
  (8, 'Dental implants');
INSERT INTO
  `treat_procedure_list` (`treat_procedure_id`, `treat_procedure_name`)
VALUES
  (9, 'Periodontics');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: treat_suggest
# ------------------------------------------------------------

INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    1,
    9,
    123,
    NULL,
    'PUH123',
    'Caries',
    'Dental Cleaning',
    '1000',
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    2,
    13,
    12,
    'Madan Mahal',
    '123456',
    'Fracture',
    'Fluoride Treatments',
    '2500',
    NULL,
    NULL,
    NULL,
    NULL,
    '4',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    3,
    13,
    12,
    'Madan Mahal',
    '123456',
    'Caries',
    'Crowns (Caps)',
    '2000',
    NULL,
    NULL,
    NULL,
    NULL,
    '3',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    4,
    16,
    1,
    'Madan Mahal',
    '123456',
    'Caries',
    'Dental Cleanings',
    '1000',
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    4,
    NULL,
    NULL,
    NULL,
    'pending',
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    5,
    16,
    1,
    'Madan Mahal',
    '123456',
    'Fracture',
    'Dental Sealants',
    '2000',
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    6,
    16,
    1,
    'Madan Mahal',
    '123456',
    'Impacted',
    'Fluoride Treatments',
    '2500',
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    7,
    16,
    1,
    'Madan Mahal',
    '123456',
    'Caries',
    'Bridges',
    '4000',
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    8,
    16,
    1,
    'Madan Mahal',
    '123456',
    'Caries',
    'Periodontal Maintenance',
    '4500',
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    9,
    16,
    1,
    'Madan Mahal',
    '123456',
    'Caries',
    'Root Canal Treatment (RCT)',
    '2000',
    NULL,
    NULL,
    NULL,
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    11,
    18,
    12,
    'Madan Mahal',
    '123456',
    'Caries',
    'Dental Cleanings',
    '1000',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '2',
    4,
    NULL,
    NULL,
    NULL,
    'ongoing',
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    12,
    18,
    12,
    'Madan Mahal',
    '123456',
    'Caries',
    'Fluoride Treatments',
    '2500',
    NULL,
    NULL,
    'pending',
    NULL,
    '2',
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    13,
    18,
    12,
    'Madan Mahal',
    '123456',
    'Caries',
    'Bridges',
    '4000',
    NULL,
    NULL,
    'pending',
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    14,
    24,
    26,
    'Madan Mahal',
    '123456',
    'Fracture',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    '',
    NULL,
    '2',
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    16,
    24,
    26,
    'Madan Mahal',
    '123456',
    'Caries',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'complete',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    17,
    29,
    11,
    'Madan Mahal',
    '123456',
    'Missing Tooth',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    '',
    NULL,
    '2',
    3,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    18,
    29,
    11,
    'Madan Mahal',
    '123456',
    'Mobility',
    'Removable Partial Dentures @ per tooth',
    '800',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '4',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    19,
    30,
    11,
    'Madan Mahal',
    '123456',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'complete',
    NULL,
    '3',
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    20,
    30,
    11,
    'Madan Mahal',
    '123456',
    'Fracture',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    22,
    33,
    2,
    'Madan Mahal',
    '789012',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'complete',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    23,
    35,
    26,
    'Madan Mahal',
    '123456',
    'Mobility',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'complete',
    NULL,
    '100',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    24,
    37,
    12,
    'Madan Mahal',
    '123456',
    'Mobility',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    25,
    39,
    32,
    'Madan Mahal',
    '123456',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'complete',
    NULL,
    '2',
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    26,
    39,
    32,
    'Madan Mahal',
    '123456',
    'Fracture',
    'Re-Root Canal Treatlment @ per tooth',
    '4000',
    NULL,
    NULL,
    'complete',
    NULL,
    '3',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    28,
    42,
    23,
    'Madan Mahal',
    '123456',
    'Caries',
    'Biopsy',
    '2500',
    NULL,
    NULL,
    'complete',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    29,
    43,
    50,
    'Madan Mahal',
    '',
    'Caries',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    30,
    45,
    54,
    'Madan Mahal',
    '',
    'Caries',
    'Re-Root Canal Treatlment @ per tooth',
    '4000',
    NULL,
    NULL,
    '',
    NULL,
    '2',
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    31,
    46,
    30,
    'Madan Mahal',
    '123456',
    'Caries',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    32,
    53,
    47,
    'Madan Mahal',
    'DH_24',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    33,
    57,
    59,
    'Madan Mahal',
    '',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'complete',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    34,
    63,
    59,
    'Madan Mahal',
    'DH_20',
    'Missing Tooth',
    'Single Implant',
    '25000',
    NULL,
    NULL,
    'complete',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    35,
    65,
    61,
    'Madan Mahal',
    'DH_20',
    'Impacted',
    'Pulpectomy (Child) @ per tooth',
    '2800',
    NULL,
    NULL,
    'complete',
    NULL,
    '1',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    36,
    65,
    61,
    'Madan Mahal',
    'DH_20',
    'Missing Tooth',
    'Re-Root Canal Treatlment @ per tooth',
    '4000',
    NULL,
    NULL,
    'pending',
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    38,
    65,
    61,
    'Madan Mahal',
    'DH_20',
    'Root Stump',
    'Amalgam Restoration@ per tooth',
    '800',
    NULL,
    NULL,
    'pending',
    NULL,
    '4',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    39,
    67,
    62,
    'Madan Mahal',
    'DH_20',
    'Periapical Abscess',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'complete',
    NULL,
    '1',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    41,
    68,
    36,
    'Madan Mahal',
    '123456',
    'Caries',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    42,
    70,
    36,
    'Madan Mahal',
    '123456',
    'Periapical Abscess',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    '',
    NULL,
    '3',
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    43,
    71,
    64,
    'Madan Mahal',
    'DH_20',
    'Caries',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'complete',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    44,
    74,
    48,
    'Madan Mahal',
    'DH_24',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    45,
    75,
    65,
    'Madan Mahal',
    'DH_12',
    'Fracture',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    46,
    79,
    71,
    'Madan Mahal',
    'DH_27',
    'Mobility',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'complete',
    NULL,
    '1',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    47,
    79,
    71,
    'Madan Mahal',
    'DH_27',
    'Supra Erupted',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'pending',
    NULL,
    '1',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    48,
    82,
    75,
    'Madan Mahal',
    'DH_27',
    'Impacted',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'pending',
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    49,
    82,
    75,
    'Madan Mahal',
    'DH_27',
    'Fracture',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '1',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    50,
    83,
    76,
    'Madan Mahal',
    '',
    'Impacted',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'complete',
    NULL,
    '1',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    51,
    86,
    79,
    'Madan Mahal',
    'DH_33',
    'Impacted',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    52,
    89,
    81,
    'Madan Mahal',
    'DH_35',
    'Caries',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'complete',
    NULL,
    '3',
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    53,
    90,
    86,
    'Madan Mahal',
    'DH_36',
    'Root Stump',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'pending',
    NULL,
    '3',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    54,
    90,
    86,
    'Madan Mahal',
    'DH_36',
    'Fracture',
    'Ceramic Braces',
    '45000',
    NULL,
    NULL,
    'complete',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    55,
    93,
    90,
    'Madan Mahal',
    'DH_29',
    'Missing Tooth',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    '',
    NULL,
    '2',
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    56,
    94,
    93,
    'Madan Mahal',
    'DH_19',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    57,
    94,
    93,
    'Madan Mahal',
    'DH_19',
    'Caries',
    'Re-Root Canal Treatlment @ per tooth',
    '4000',
    NULL,
    NULL,
    'pending',
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    58,
    94,
    93,
    'Madan Mahal',
    'DH_19',
    'Fracture',
    'Ceramic Braces',
    '45000',
    NULL,
    NULL,
    'pending',
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    59,
    94,
    93,
    'Madan Mahal',
    'DH_19',
    'Fracture',
    'Biopsy',
    '2500',
    NULL,
    NULL,
    '',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    60,
    95,
    96,
    'Madan Mahal',
    '2',
    'Fracture',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'complete',
    NULL,
    '1',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    61,
    96,
    97,
    'Madan Mahal',
    'DH_25',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'pending',
    NULL,
    '1',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    62,
    97,
    108,
    'Madan Mahal',
    'DH_15',
    'Impacted',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'pending',
    NULL,
    '1',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    63,
    98,
    108,
    'Madan Mahal',
    'DH_15',
    'Fracture',
    'Indirect Pulp Capping @ per tooth',
    '1500',
    NULL,
    NULL,
    'complete',
    NULL,
    '1',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    64,
    99,
    108,
    'Madan Mahal',
    'DH_15',
    'Missing Tooth',
    'Pulpectomy (Child) @ per tooth',
    '2800',
    NULL,
    NULL,
    'pending',
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    65,
    100,
    115,
    'Madan Mahal',
    'DH_38',
    'Fracture',
    'Third Molar /Impacted Tooth Removal',
    '3000',
    NULL,
    NULL,
    'ongoing',
    NULL,
    '3',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    66,
    101,
    115,
    'Madan Mahal',
    'DH_38',
    'Caries',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'complete',
    NULL,
    '1',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    67,
    102,
    116,
    'Madan Mahal',
    'DH_39',
    'Caries',
    'Ceramic Braces',
    '45000',
    NULL,
    NULL,
    '',
    NULL,
    '4',
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    68,
    102,
    116,
    'Madan Mahal',
    'DH_39',
    'Missing Tooth',
    'Porcelain Fused to Metal @ per Crown',
    '3000',
    NULL,
    NULL,
    '',
    NULL,
    '2',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    69,
    103,
    120,
    'Madan Mahal',
    'DH_41',
    'Caries',
    'Metal Braces',
    '30000',
    NULL,
    NULL,
    'complete',
    NULL,
    '5',
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    70,
    107,
    119,
    'Madan Mahal',
    'DH_40',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    'complete',
    NULL,
    '1',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    71,
    108,
    122,
    'Madan Mahal',
    'DH_42',
    'Mobility',
    'Porcelain Fused to Metal @ per Crown',
    '3000',
    NULL,
    NULL,
    'complete',
    NULL,
    '1',
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    72,
    109,
    123,
    'Madan Mahal',
    'DH_37',
    'Periapical Abscess',
    'Third Molar /Impacted Tooth Removal',
    '3000',
    NULL,
    NULL,
    'pending',
    NULL,
    '1',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    73,
    111,
    123,
    'Madan Mahal',
    'DH_37',
    'Caries',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    NULL,
    '',
    NULL,
    '2',
    2,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `treat_suggest` (
    `ts_id`,
    `tp_id`,
    `appoint_id`,
    `branch_name`,
    `p_uhid`,
    `desease`,
    `treatment_name`,
    `totalCost`,
    `discount`,
    `paid_amount`,
    `treatment_status`,
    `consider_sitting`,
    `total_sitting`,
    `current_sitting`,
    `upcoming_sitting`,
    `appoint_date`,
    `note`,
    `current_sitting_status`,
    `upcoming_sitting_status`
  )
VALUES
  (
    74,
    112,
    123,
    'Madan Mahal',
    'DH_37',
    'Fracture',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    NULL,
    'pending',
    NULL,
    '2',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: treatment_list
# ------------------------------------------------------------

INSERT INTO
  `treatment_list` (
    `treatment_id`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`
  )
VALUES
  (4, 'Fluoride Treatments', '10000', '20');
INSERT INTO
  `treatment_list` (
    `treatment_id`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`
  )
VALUES
  (6, 'widal', '200', '10');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: treatment_list_copy
# ------------------------------------------------------------

INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    1,
    2,
    'Dental IOPA X Ray',
    'Digital Compuler zcd XRay (R.V.G.)',
    '300',
    NULL,
    'Digital Compuler zcd XRay (R.V.G.)',
    'Digital Compuler zcd XRay (R.V.G.)'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    2,
    3,
    'Endodontlc Procedures',
    'Root Canal Treatment @ per tooth',
    '3000',
    NULL,
    'Root Canal Treatment @ per tooth',
    'Root Canal Treatment @ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    3,
    3,
    'Endodontlc Procedures',
    'Re-Root Canal Treatlment @ per tooth',
    '4000',
    NULL,
    'Re-Root Canal Treatlment @ per tooth',
    'Re-Root Canal Treatlment @ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    4,
    3,
    'Endodontlc Procedures',
    'Pulpectomy (Child) @ per tooth',
    '2800',
    NULL,
    'Pulpectomy (Child) @ per tooth',
    'Pulpectomy (Child) @ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    5,
    3,
    'Endodontlc Procedures',
    'Post and core @ per tooth',
    '2000',
    NULL,
    'Post and core @ per tooth',
    'Post and core @ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    6,
    3,
    'Endodontlc Procedures',
    'Indirect Pulp Capping @ per tooth',
    '1500',
    NULL,
    'Indirect Pulp Capping @ per tooth',
    'Indirect Pulp Capping @ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    7,
    3,
    'Endodontlc Procedures',
    'Indirect Pulp Capping with MTA @ per tooth',
    '2000',
    NULL,
    'Indirect Pulp Capping with MTA @ per tooth',
    'Indirect Pulp Capping with MTA @ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    8,
    4,
    'Restorative & Cosmetic Procedures',
    'Composite Restoration @ per tooth',
    '1500',
    NULL,
    'Composite Restoration @ per tooth',
    'Composite Restoration @ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    9,
    4,
    'Restorative & Cosmetic Procedures',
    'Amalgam Restoration@ per tooth',
    '800',
    NULL,
    'Amalgam Restoration@ per tooth',
    'Amalgam Restoration@ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    10,
    4,
    'Restorative & Cosmetic Procedures',
    'GIC Restoration @ per tooth',
    '600',
    NULL,
    'GIC Restoration @ per tooth',
    'GIC Restoration @ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    11,
    4,
    'Restorative & Cosmetic Procedures',
    'Laminates and Veneers@ per tooth',
    '10000',
    NULL,
    'Laminates and Veneers@ per tooth',
    'Laminates and Veneers@ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    12,
    4,
    'Restorative & Cosmetic Procedures',
    'Direct Composite Veneer @ per tooth',
    '2500',
    NULL,
    'Direct Composite Veneer @ per tooth',
    'Direct Composite Veneer @ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    13,
    4,
    'Restorative & Cosmetic Procedures',
    'Teeth Bleaching In Office Whitening',
    '8000',
    NULL,
    'Teeth Bleaching In Office Whitening',
    'Teeth Bleaching In Office Whitening'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    14,
    4,
    'Restorative & Cosmetic Procedures',
    'Teeth Bleaching at Home Whitening',
    '5000',
    NULL,
    'Teeth Bleaching at Home Whitening',
    'Teeth Bleaching at Home Whitening'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    15,
    4,
    'Restorative & Cosmetic Procedures',
    'Dental Jewellery (Skyce Crystal)',
    '2000',
    NULL,
    'Dental Jewellery (Skyce Crystal)',
    'Dental Jewellery (Skyce Crystal)'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    16,
    5,
    'Prosthetic Procedures',
    'Metal Free Crown Ziconia Crowns @ per Crown',
    '8000',
    NULL,
    'Metal Free Crown Ziconia Crowns @ per Crown',
    'Metal Free Crown Ziconia Crowns @ per Crown'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    17,
    5,
    'Prosthetic Procedures',
    'Porcelain Fused to Metal @ per Crown',
    '3000',
    NULL,
    'Porcelain Fused to Metal @ per Crown',
    'Porcelain Fused to Metal @ per Crown'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    18,
    5,
    'Prosthetic Procedures',
    'Metal Crowns @ Per Crown',
    '1500',
    NULL,
    'Metal Crowns @ Per Crown',
    'Metal Crowns @ Per Crown'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    19,
    5,
    'Prosthetic Procedures',
    'Metal Crowns with acrylic facing @ per Crown',
    '1800',
    NULL,
    'Metal Crowns with acrylic facing @ per Crown',
    'Metal Crowns with acrylic facing @ per Crown'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    20,
    5,
    'Prosthetic Procedures',
    'Removable Partial Dentures @ per tooth',
    '800',
    NULL,
    'Removable Partial Dentures @ per tooth',
    'Removable Partial Dentures @ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    21,
    5,
    'Prosthetic Procedures',
    'Removable Full Moulh Complete Denture',
    '15000',
    NULL,
    'Removable Full Moulh Complete Denture',
    'Removable Full Moulh Complete Denture'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    22,
    5,
    'Prosthetic Procedures',
    'Crown & Bridge refix',
    '300',
    NULL,
    'Crown & Bridge refix',
    'Crown & Bridge refix'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    23,
    6,
    'Orthodentics (Braces) Procedures',
    'Metal Braces',
    '30000',
    NULL,
    'Metal Braces',
    'Metal Braces'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    24,
    6,
    'Orthodentics (Braces) Procedures',
    'Ceramic Braces',
    '45000',
    NULL,
    'Ceramic Braces',
    'Ceramic Braces'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    25,
    6,
    'Orthodentics (Braces) Procedures',
    'Lingual Braces',
    '80000',
    NULL,
    'Lingual Braces',
    'Lingual Braces'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    26,
    6,
    'Orthodentics (Braces) Procedures',
    'lnvisalign (clear or invisible braces)',
    '80000',
    NULL,
    'lnvisalign (clear or invisible braces)',
    'lnvisalign (clear or invisible braces)'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    27,
    6,
    'Orthodentics (Braces) Procedures',
    'Retention plate@ per arch',
    '2000',
    NULL,
    'Retention plate@ per arch',
    'Retention plate@ per arch'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    28,
    6,
    'Orthodentics (Braces) Procedures',
    'Self ligating metal braces',
    '55000',
    NULL,
    'Self ligating metal braces',
    'Self ligating metal braces'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    29,
    6,
    'Orthodentics (Braces) Procedures',
    'Self ligatating ceramic braces',
    '75000',
    NULL,
    'Self ligatating ceramic braces',
    'Self ligatating ceramic braces'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    30,
    6,
    'Orthodentics (Braces) Procedures',
    'Retainer (removable)',
    '3000',
    NULL,
    'Retainer (removable)',
    'Retainer (removable)'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    31,
    7,
    'Oral Surgery Procedures',
    'Extraction per tooth under LA',
    '500',
    NULL,
    'Extraction per tooth under LA',
    'Extraction per tooth under LA'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    32,
    7,
    'Oral Surgery Procedures',
    'Complicated Extraction per tooth under LA',
    '1000',
    NULL,
    'Complicated Extraction per tooth under LA',
    'Complicated Extraction per tooth under LA'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    33,
    7,
    'Oral Surgery Procedures',
    'Third Molar /Impacted Tooth Removal',
    '3000',
    NULL,
    'Third Molar /Impacted Tooth Removal',
    'Third Molar /Impacted Tooth Removal'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    34,
    7,
    'Oral Surgery Procedures',
    'Apicoectomy @ per tooth',
    '2500',
    NULL,
    'Apicoectomy @ per tooth',
    'Apicoectomy @ per tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    35,
    7,
    'Oral Surgery Procedures',
    'Minor Surgical Procedures under LA',
    '5000',
    NULL,
    'Minor Surgical Procedures under LA',
    'Minor Surgical Procedures under LA'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    36,
    7,
    'Oral Surgery Procedures',
    'Biopsy',
    '2500',
    NULL,
    'Biopsy',
    'Biopsy'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    37,
    7,
    'Oral Surgery Procedures',
    'I& D (Extra Oral)',
    '5000',
    NULL,
    'I& D (Extra Oral)',
    'I& D (Extra Oral)'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    38,
    7,
    'Oral Surgery Procedures',
    'I& D ( ntra Oral)',
    '1500',
    NULL,
    'I& D ( ntra Oral)',
    'I& D ( ntra Oral)'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    40,
    8,
    'Dental implants',
    'Single Implant',
    '25000',
    NULL,
    'Single Implant',
    'Single Implant'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    41,
    8,
    'Dental implants',
    'Full mouth Implant',
    '250000',
    NULL,
    'Full mouth Implant',
    'Full mouth Implant'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    42,
    8,
    'Dental implants',
    'Bone Grafting Procedure',
    '5000',
    NULL,
    'Bone Grafting Procedure',
    'Bone Grafting Procedure'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    43,
    9,
    'Periodontics',
    'Oral Prophylaxis (Scaling)',
    '1500',
    NULL,
    'Oral Prophylaxis (Scaling)',
    'Oral Prophylaxis (Scaling)'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    44,
    9,
    'Periodontics',
    'Gingivectomy per quadrant by scalpel',
    '3000',
    NULL,
    'Gingivectomy per quadrant by scalpel',
    'Gingivectomy per quadrant by scalpel'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    45,
    9,
    'Periodontics',
    'Flap Surgery per quadrant without bone graft',
    '6000',
    NULL,
    'Flap Surgery per quadrant without bone graft',
    'Flap Surgery per quadrant without bone graft'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    46,
    9,
    'Periodontics',
    'Bone Graft Per Tooth',
    '500',
    NULL,
    'Bone Graft Per Tooth',
    'Bone Graft Per Tooth'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    47,
    9,
    'Periodontics',
    'Operculectomy',
    '1000',
    NULL,
    'Operculectomy',
    'Operculectomy'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (49, 1, 'OPD', 'OPD', '500', NULL, 'OPD', 'OPD');
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    51,
    8,
    'Dental implants',
    'Sinus Lift Procedure',
    '15000',
    NULL,
    'Sinus Lift Procedure',
    'Sinus Lift Procedure'
  );
INSERT INTO
  `treatment_list_copy` (
    `treatment_id`,
    `treat_procedure_id`,
    `treat_procedure_name`,
    `treatment_name`,
    `treatment_cost`,
    `treatment_discount`,
    `value`,
    `label`
  )
VALUES
  (
    54,
    1919,
    'test procedure',
    'test treatment',
    '9898',
    '',
    'test value',
    'test label'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: treatment_package
# ------------------------------------------------------------

INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    1,
    '789012',
    'Madan Mahal',
    2,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-05 13:07:08.300880'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    2,
    '789012',
    'Madan Mahal',
    2,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-05 13:07:46.197445'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    3,
    '789012',
    'Madan Mahal',
    2,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-05 13:07:54.481834'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    4,
    '789012',
    'Madan Mahal',
    2,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-05 13:09:24.200832'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    5,
    '789012',
    'Madan Mahal',
    2,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-05 13:09:32.487899'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    6,
    '789012',
    'Madan Mahal',
    2,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-05 16:37:58.197325'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    7,
    '123456',
    'Madan Mahal',
    1,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-06 10:31:17.100523'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    8,
    '123456',
    'Madan Mahal',
    1,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-06 15:34:44.357358'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    9,
    '123456',
    'Madan Mahal',
    1,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-06 17:10:15.217180'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    10,
    '123456',
    'Madan Mahal',
    12,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-08 10:44:17.295053'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    11,
    '123456',
    'Madan Mahal',
    12,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-08 10:44:46.990498'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    12,
    '123456',
    'Madan Mahal',
    1,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-08 12:53:48.402754'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    13,
    '123456',
    'Madan Mahal',
    12,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-08 15:24:49.534693'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    14,
    '123456',
    'Madan Mahal',
    12,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-08 23:28:12.396266'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    15,
    '123456',
    'Madan Mahal',
    1,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-09 10:10:24.389591'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    16,
    '123456',
    'Madan Mahal',
    1,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-09 10:40:26.269021'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    17,
    '123456',
    'Madan Mahal',
    12,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-10 13:01:33.339542'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    18,
    '123456',
    'Madan Mahal',
    12,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-10 13:01:39.146973'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    19,
    '123456',
    'Madan Mahal',
    1,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-11 14:46:24.793710'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    20,
    '123456',
    'Madan Mahal',
    1,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-11 14:49:53.887764'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    21,
    '123456',
    'Madan Mahal',
    12,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-11 14:50:39.037733'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    22,
    '123456',
    'Madan Mahal',
    1,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-12 15:42:21.040148'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    23,
    '123456',
    'Madan Mahal',
    1,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-13 11:12:40.564662'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    24,
    '123456',
    'Madan Mahal',
    26,
    0,
    'dg_4',
    'shadab',
    'completed',
    'Pediatric',
    '2024-04-13 11:33:20.618341'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    25,
    '123456',
    'Madan Mahal',
    26,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-14 17:49:32.233393'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    26,
    '123456',
    'Madan Mahal',
    26,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-15 10:34:19.555884'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    27,
    '123456',
    'Madan Mahal',
    26,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-15 13:33:21.066207'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    28,
    '123456',
    'Madan Mahal',
    26,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-18 12:36:55.577204'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    29,
    '123456',
    'Madan Mahal',
    11,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-18 12:45:13.422394'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    30,
    '123456',
    'Madan Mahal',
    11,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-19 13:12:59.739951'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    31,
    '123456',
    'Madan Mahal',
    11,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-20 19:00:30.400952'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    32,
    '123456',
    'Madan Mahal',
    11,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-20 19:01:15.784829'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    33,
    '789012',
    'Madan Mahal',
    2,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-20 19:57:30.764090'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    34,
    '789012',
    'Madan Mahal',
    2,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-20 20:11:21.491502'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    35,
    '123456',
    'Madan Mahal',
    26,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-21 17:16:06.479260'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    36,
    '123456',
    'Madan Mahal',
    26,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-21 17:16:10.460162'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    37,
    '123456',
    'Madan Mahal',
    12,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-21 19:29:36.840005'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    38,
    '123456',
    'Madan Mahal',
    12,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-21 20:32:40.290612'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    39,
    '123456',
    'Madan Mahal',
    32,
    0,
    'dg_4',
    'shadab',
    'completed',
    'Pediatric',
    '2024-04-24 12:42:14.582371'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    40,
    '123456',
    'Madan Mahal',
    23,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-24 17:23:00.098738'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    41,
    '123456',
    'Madan Mahal',
    23,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-24 17:23:11.698625'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    42,
    '123456',
    'Madan Mahal',
    23,
    0,
    'dg_4',
    'shadab',
    'completed',
    'Dental-X',
    '2024-04-24 17:25:53.492679'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    43,
    'DH_21',
    'Madan Mahal',
    50,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-24 18:52:46.810197'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    44,
    'DH_21',
    'Madan Mahal',
    53,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-24 19:25:16.315641'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    45,
    'DH_23',
    'Madan Mahal',
    54,
    0,
    'dg_4',
    'shadab',
    'ongoing',
    'Pediatric',
    '2024-04-24 20:02:17.980898'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    46,
    '123456',
    'Madan Mahal',
    30,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-24 20:53:16.851477'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    47,
    'DH_24',
    'Madan Mahal',
    56,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-25 12:39:34.507506'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    48,
    'DH_24',
    'Madan Mahal',
    56,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-25 14:12:53.115617'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    49,
    'DH_24',
    'Madan Mahal',
    56,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 14:16:21.926866'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    50,
    'DH_24',
    'Madan Mahal',
    56,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 14:20:02.246575'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    51,
    'DH_24',
    'Madan Mahal',
    56,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-25 14:21:44.049761'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    52,
    'DH_24',
    'Madan Mahal',
    56,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 14:22:33.415506'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    53,
    'DH_20',
    'Madan Mahal',
    47,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 14:29:11.716442'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    54,
    'DH_20',
    'Madan Mahal',
    59,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 14:38:23.320904'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    55,
    'DH_20',
    'Madan Mahal',
    59,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 14:39:44.179770'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    56,
    'DH_20',
    'Madan Mahal',
    59,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 14:40:52.401007'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    57,
    'DH_20',
    'Madan Mahal',
    59,
    0,
    'dg_4',
    'shadab',
    'completed',
    'Pediatric',
    '2024-04-25 14:55:26.700107'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    58,
    'DH_20',
    'Madan Mahal',
    59,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 15:12:11.216537'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    59,
    'DH_20',
    'Madan Mahal',
    59,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-25 15:12:18.159485'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    60,
    'DH_20',
    'Madan Mahal',
    59,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Pediatric',
    '2024-04-25 15:13:50.664496'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    61,
    'DH_20',
    'Madan Mahal',
    60,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 15:16:01.361280'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    62,
    'DH_20',
    'Madan Mahal',
    60,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 15:16:25.406471'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    63,
    'DH_20',
    'Madan Mahal',
    59,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 15:19:08.177766'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    64,
    'DH_20',
    'Madan Mahal',
    60,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 15:33:04.895209'
  );
INSERT INTO
  `treatment_package` (
    `tp_id`,
    `uhid`,
    `branch_name`,
    `appointment_id`,
    `examination_id`,
    `doctor_id`,
    `doctor_name`,
    `package_status`,
    `diagnosis_category`,
    `created_at`
  )
VALUES
  (
    65,
    'DH_12',
    'Madan Mahal',
    61,
    0,
    'dg_4',
    'shadab',
    NULL,
    'Dental-X',
    '2024-04-25 15:48:45.769675'
  );
  )
