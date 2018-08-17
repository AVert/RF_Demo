*** Settings ***
Documentation    Suite description
Documentation    Suite description
Library     Selenium2Library
#Library     ../CustomLibrary/DonationLibrary.py
Resource      ../TestCases/RegressionTestSuite.robot

*** Variables ***





# Field Verification WebElements
${Applicant_Obj}        xpath=.//*[@id='01rf4000000LqQr_Tab']/a
${Applicant_Name_E}     xpath=.//*[@id='Name_ileinner']
${Household_contact_E}        xpath=.//*[@id='CF00Nf400000AI7r0_ileinner']
${ODP_Contact_E}        xpath=.//*[@id='CF00Nf400000AI7r3_ileinner']
${Record_Type_E}        xpath=.//*[@id='RecordType_ileinner']
${Payment_Mode_E}       xpath=.//*[@id='00Nf400000AJWdu_ileinner']
${Payment_Type_E}       xpath=.//*[@id='00Nf400000AI7rd_ileinner']
${Applicant_Email_E}      xpath=.//*[@id='00Nf400000AI7qu_ileinner']
${Primary_Contact_E}       xpath=.//*[@id='00Nf400000AI7r4_ileinner']
${Applicant_Phone_E}       xpath=.//*[@id='00Nf400000AI7r4_ileinner']
${Duplication_Status_E}      xpath=.//*[@id='00Nf400000AI7qt_ileinner']
${Annual_Ministry_Revneue_E}        xpath=.//*[@id='00Nq0000001qDMD_ileinner']
${Payment_Verified_E}       xpath=.//*[@id='00Nf400000AI7rQ_ileinner']
${Attorney_FN_E}        xpath=.//*[@id='00Nq0000001qDMC_ileinner']
${Attorney_City_E}      xpath=.//*[@id='00Nq0000001qDM9_ileinner']
${Attorney_LN_E}        xpath=.//*[@id='00Nq0000001qDMA_ileinner']
${Attorney_State_E}     xpath=.//*[@id='00Nq0000001qDMB_ileinner']
${Applicant_FN_E}       xpath=.//*[@id='00Nf400000AI7qv_ileinner']
${Applicant_LN_E}       xpath=.//*[@id='00Nf400000AI7r1_ileinner']
${Title}        xpath=.//*[@id='00Nf400000AI7r6_ileinner']
${Ministry_Name_E}      xpath=.//*[@id='00Nq0000001qNbS_ileinner']

*** Keywords ***

Get values from Applicant Detail record
    ${Applicant_Name}=      Get Text        ${Applicant_Name_E}
    Set Global Variable  ${Applicant_Name}
    ${Household_Contact}=   Get Text    ${Household_contact_E}
    Set Global Variable  ${Household_Contact}
    ${ODP_Contact}=   Get Text    ${ODP_Contact_E}
    Set Global Variable  ${ODP_Contact}
    ${Applicant_RecordType}=   Get Text    ${Record_Type_E}
    Set Global Variable  ${Applicant_RecordType}
    ${Applicant_Email}=   Get Text    ${Applicant_Email_E}
    Set Global Variable  ${Applicant_Email}
    ${Applicant_Phone}=   Get Text    ${Applicant_Phone_E}
    Set Global Variable  ${Applicant_Phone}
    ${Duplication_Status}=   Get Text    ${Duplication_Status_E}
    Set Global Variable  ${Duplication_Status}
    ${Primary_Contact}=   Get Text    ${Primary_Contact_E}
    Set Global Variable  ${Primary_Contact}








Verify the Applicant Detail

