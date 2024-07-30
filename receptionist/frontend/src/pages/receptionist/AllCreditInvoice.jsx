import React, { useEffect, useState } from "react";
import styled from "styled-components";
import Header from "../../components/receptionist/Header";
import Sider from "../../components/receptionist/Sider";
import SittingCreditBill from "./SittingCreditBill";


function AllCreditInvoice() {
  
  return (
    <Wrapper>
      <div className="header">
        <Header />
      </div>

      <div className="row flex-nowrap ">
        <div className="col-lg-1 col-1" id="hd">
          <Sider />
        </div>
        <div className="col-lg-11 mt-2" id="set">
          <div className="text-center">
            <h3>All Patients Credit Invoice</h3>
          </div>

          <ul className="nav nav-tabs" id="myTab" role="tablist">
        <li className="nav-item" role="presentation">
          <button
            className="nav-link active"
            id="home-tab"
            data-bs-toggle="tab"
            data-bs-target="#home-tab-pane"
            type="button"
            role="tab"
            aria-controls="home-tab-pane"
            aria-selected="true"
          >
            Sitting Invoice
          </button>
        </li>
        <li className="nav-item" role="presentation">
          <button
            className="nav-link"
            id="profile-tab"
            data-bs-toggle="tab"
            data-bs-target="#profile-tab-pane"
            type="button"
            role="tab"
            aria-controls="profile-tab-pane"
            aria-selected="false"
          >
            Final Invoice
          </button>
        </li>
        <div className="tab-content" id="myTabContent">
          <div
            className="tab-pane fade show active"
            id="home-tab-pane"
            role="tabpanel"
            aria-labelledby="home-tab"
            tabindex="0"
          >
            <ul className="list-group">
              <li className="list-group-item">
               <SittingCreditBill/>
              </li>
            </ul>
          </div>
          </div>
        </ul>
       
        </div>
      </div>
    </Wrapper>
  );
}

export default AllCreditInvoice;
const Wrapper = styled.div`
  overflow: hidden;
  
 
 
 
  #hd {
    padding-top: 60px; /* Height of header */
    min-height: 100vh;
    position: fixed;
    @media screen and (max-width: 768px) {
      height: 68rem;
    }
    @media screen and (min-width: 768px) and (max-width: 1020px) {
      height: 58rem;
    }
  }

  #set {
    margin-left: -4.5rem;
    padding-left: 150px; /* Width of sidebar */
    padding-top: 90px; /* Height of header */
    flex-grow: 1;
    overflow-y: auto;

    @media screen and (max-width: 768px) {
      margin-left: -2rem;
    }
    @media screen and (min-width: 768px) and (max-width: 1020px) {
      margin-left: -2rem;
    }
    @media screen and (min-width: 1020px) and (max-width: 1500px) {
      margin-left: -2rem;
    }
    @media screen and (min-width: 1500px) and (max-width: 1700px) {
      margin-left: -1.9rem;
    }
    @media screen and (min-width: 1700px) and (max-width: 2000px) {
      margin-left: -1rem;
    }

    @media screen and (min-width: 2000px) and (max-width: 2500px) {
      margin-left: 0rem;
    }
  }

  .header {
    position: fixed;
    min-width: 100%;
    z-index: 100;
  }
  .nav-link {
    background-color: #22a6b3;
    color: #000;
    margin-left: 1px;
  }
 
  

`;
