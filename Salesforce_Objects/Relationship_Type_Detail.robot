*** Settings ***
Documentation    Suite description
Library  Selenium2Library

*** Variables ***

${Object_Link}  https://adflegal--qarel.my.salesforce.com/a0b/o
${New_Button_E}   name=new
${RecordType_E}     xpath=.//*[@id='p3']
${Contniue/Save_B}   name=save
${First_Contact_E}     xpath=.//*[@id='CF00Nf4000009hewO']
${Priority_E}   xpath=.//*[@id='00N1b000000bKbN']
${First_Relationship_Type_E}    xpath=.//*[@id='CF00Nf4000009hewP']
${Second_Contact_E}     xpath=.//*[@id='CF00Nf4000009hewV']
${Second_Relationship_Type_E}   xpath=.//*[@id='CF00Nf4000009hewW']
${Start_Date_E}     xpath=.//*[@id='00Nf4000009hewY']
${End_Date_E}       xpath=.//*[@id='00Nf4000009hewL']
${Second_SoftCredit_E}      xpath=.//*[@id='00Nf4000009hewK']
${First_SoftCredit_E}       xpath=.//*[@id='00Nf4000009hewJ']
${Cancel_E}     name=cancel
${Active_Checkbox_E}    xpath=.//*[@id='00Nf400000AILqu_chkbox']

#Verification Elements

${First_Account_Value_E}    xpath=.//*[@id='CF00Nf4000009hewN_ileinner']
${Second_Account_Value_E}   xpath=.//*[@id='CF00Nf4000009hewV_ileinner']
${First_Contact_Value_E}    xpath=.//*[@id='CF00Nf4000009hewO_ileinner']
${Second_Contact_Value_E}   xpath=.//*[@id='CF00Nf4000009hewV_ileinner']
${Priority_Value_E}     xpath=.//*[@id='00N1b000000bKbN_chkbox']
${First_Relationship_Value_E}   xpath=.//*[@id='CF00Nf4000009hewP_ileinner']
${Second_Relationship_Value_E}  xpath=.//*[@id='CF00Nf4000009hewW_ileinner']
${Start_Date_Value_E}   xpath=.//*[@id='00Nf4000009hewY_ilecell']
${End_Date_Value_E}     xpath=.//*[@id='00Nf4000009hewL_ileinner']




*** Keywords ***

