*** Settings ***
Documentation    Suite description
#Library     Selenium2Library
#Library     ../CustomLibrary/AccountLibrary.py
Resource  ../TestCases/RegressionTestSuite.robot


*** Variables ***
#${Account_Name}    Id=acc
${Account_Record_Type_Selection_E}    name=p3
${Account_Name_E}    Id=acc2
${Billing_Street_E}    Id=acc17street
${Billing_City_E}    Id=acc17city
${Billing_State_E}    Id=acc17state
${Billing_Zip_E}    Id=acc17zip
${Billing_Country_E}    Id=acc17country
${Account_Obj_E}    xpath=.//*[@id='Account_Tab']/a
${Acc_Type_E}       Id=acc6test
${New_Button_E}     name=new
${Continue}     xpath=.//*[@id='bottomButtonRow']/input[1]
${Save}    name=save

#Account field verification

${Account_Name_VF}      xpath=.//*[@id='acc2_ileinner']
${Account_RecordType_VE}        xpath=.//*[@id='RecordType_ileinner']
${Account_Type_VE}      xpath=.//*[@id='acc6_ileinner']
${Account_Owner_VE}     xpath=.//*[@id='acc1_ileinner']






*** Keywords ***
Account Creation
    wait until element is visible  ${Account_Obj_E}
    Click Element    ${Account_Obj_E}
    Click Element    ${New_Button_E}
    Set Selenium Implicit Wait    20s
    Click Element    ${Continue}
    Set Browser Implicit Wait       10s
    Set Selenium Speed    1s
    Input Text    ${Account_Name_E}    ${Acc_Name_V}
    Input Text    ${Billing_Street_E}    ${Bill_St_V}
    Input Text    ${Billing_City_E}       ${Bill_City_V}
    Input Text    ${Billing_State_E}   ${Bill_State_V}
    Input Text    ${Billing_Zip_E}    ${Bill_Code_V}
    Input Text    ${Billing_Country_E}    ${Bill_Country_V}
    #@{Type1}=    Get List Items    ${Acc_Type_E}
    #Select From List By Value    ${Acc_Type_E}    @{Type1}[3]
    Click Element    ${Save}
    Capture Page Screenshot

Get values from Contact record
    ${Account_Owner}=   Get Text    ${Account_Owner_VE}
    Set Global Variable      ${Account_Owner}
    ${Account_Type}=    Get Text    ${Account_Type_VE}
    Set Global Variable  ${Account_Type}







Organization_Account_Verification



Household_Account_Verification

