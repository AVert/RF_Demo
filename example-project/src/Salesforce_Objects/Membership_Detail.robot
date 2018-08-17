*** Settings ***
Documentation    Suite description
Documentation    Suite description
Library     Selenium2Library
#Library     ../CustomLibrary/DonationLibrary.py
Resource      ../TestCases/RegressionTestSuite.robot

*** Variables ***


#Field verification Webelements
${Membership_obj}       xpath=.//*[@id='01rf4000000LqQt_Tab']/a
${Memebership_Name_E}     xpath=.//*[@id='lookupa1lq0000001uM5V00Nf400000AI7re']
${ODP_contact_E}        xpath=.//*[@id='CF00Nf400000AI7rf_ileinner']
${Record_Type_E}        xpath=.//*[@id='RecordType_ileinner']
${Payment_Mode_E}       xpath=.//*[@id='00Nf400000AJWdu_ileinner']
${Payment_Type_E}       xpath=.//*[@id='00Nf400000AI7rd_ileinner']
${Membsership_Email_E}      xpath=.//*[@id='00Nf400000AI7rS_ileinner']
${Membership_Price_E}       xpath=.//*[@id='CF00Nf400000AI7rc_ileinner']
${StartDate_E}      xpath=.//*[@id='00Nf400000AI7ri_ileinner']
${Applicant_Name_E}     xpath=.//*[@id='00Nf400000AI7rW_ilecell']
${Annual_Ministry_Revneue_E}        xpath=.//*[@id='00Nq0000001qDMD_ileinner']
${Payment_Verified_E}       xpath=.//*[@id='00Nf400000AI7rQ_ileinner']
${Prmo_Code_E}      xpath=.//*[@id='CF00Nf400000AJWdv_ileinner']



*** Keywords ***

