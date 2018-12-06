*** Settings ***
Documentation    Suite description
Library     Selenium2Library
Resource   ../TestCases/TestSuiteVariables.robot
Resource   ../Salesforce_Objects/Contact.robot


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
${EditButton_E}     name=edit

#Account field verification

${Account_Name_VF}      xpath=.//*[@id='acc2_ileinner']
${Account_RecordType_VE}        xpath=.//*[@id='RecordType_ileinner']
${Account_Type_VE}      xpath=.//*[@id='acc6_ileinner']
${Account_Owner_VE}     xpath=.//*[@id='acc1_ileinner']
${Denomination_E}       xpath=.//*[@id='00Nf400000AI7eb_ileinner']
${Account_Type_E}       xpath=.//*[@id='acc6_ileinner']
${Billing_Address_Table_E}      xpath=.//*[@id='acc17_ileinner']/table/tbody/tr[1]/td
${ODP_Contact_E}    xpath=.//*[@id='0011b00000YQWiy_RelatedContactList_body']/table/tbody/tr[2]/th/a
${AccountName}  IdaMyers_Church

${UsernameElement}      Id=username
${PasswordElement}      Id=password
${Submit}       Id=Login
${URL} =  https://test.salesforce.com


*** Keywords ***
Organization_Account_Creation
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

Get_values_from_Contact_record
    ${Account_Owner}=   Get Text    ${Account_Owner_VE}
    Set Global Variable      ${Account_Owner}
    ${Account_Type}=    Get Text    ${Account_Type_VE}
    Set Global Variable  ${Account_Type}


Organization_Account_Verification




Household_Account_Verification







ODP_Contact_Verification_From_Account
    ${AccountName}=    Get Text    ${Account_Name_VF}
    Set Global Variable    ${AccountName}
    ${ODP_Contact}=     Get Text    ${ODP_Contact_E}
    Set Global Variable  ${ODP_Contact}
    Should Be Equal  ${AccountName} ${ODP_Contact}

Account_Table_Iteration
    wait until element is visible  ${Account_Obj_E}
    Click Element  ${Account_Obj_E}
    Set Selenium Implicit Wait  10s
    ${Row_Count}=    Get Matching Xpath Count    xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr
    Log    ${Row_Count}
    : FOR    ${i}    IN RANGE    1    ${Row_Count}+1
    \    Log    ${i}
    \    ${GetTablevalue}=    Get Text    xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr[${i}]/th
    \    Log    ${GetTablevalue}
    \    Run Keyword If    "${GetTablevalue}"=="Kerry Dennis Household"    Click Element    xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr[${i}]/th/a
    \    Exit For Loop If    "${GetTablevalue}"=="Kerry Dennis Household"
    Sleep    10s
    Wait Until Element Is Visible   ${EditButton_E}

Household_Contact_Creation_From_Account
    Click Element  xpath=.//h3[contains(.,'Contact')]/following::input[@name='new']
    Wait Until Element Is Visible   ${save}
    Contact Creation With Salutation

Account_Billing_Address

    Click Element  ${Edit_Button}
    ${Biling_Street_Value}=     Get Text    ${Billing_Street_E}
    Set Global Variable  ${Biling_Street_Value}
    ${Billing_City_Value}=      Get Text    ${Billing_City_E}
    Set Global Variable  ${Billing_City_Value}
    ${Billing_Country_Value}=   Get Text    ${Billing_Country_E}
    Set Global Variable   ${Billing_Country_Value}
    ${Billing_State_Value}=     Get Text    ${Billing_State_E}
    Set Global Variable  ${Billing_State_Value}
    ${Billing_Zip_Value}=   Get Text    ${Billing_Zip_E}
    Set Global Variable  ${Billing_Zip_Value}

Updating_The_Billing_Address

    Clear Element Text  ${Billing_Country_E}
    Input Text  ${Billing_Country_E}    Test
    Click Element  ${Continue/Save_E}
    ${Alert}=    Get Text    xpath=.//*[@id='errorDiv_ep']
    Log    ${Alert}
    Take Screenshot Without Embedding
    Element Should Not Be Visible    ${Edit_Button}
    Click Button    ${Cancel}

























