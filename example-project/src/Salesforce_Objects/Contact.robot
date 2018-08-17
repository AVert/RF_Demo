*** Settings ***
Documentation    Suite description
#Library     Selenium2Library
#Library     ../CustomLibrary/Contact.py
#Variables  ../TestCases/RegressionTestSuite.robot
#Resource      ../TestCases/RegressionTestSuite.robot
Resource   ../TestCases/TestSuiteVariables.robot
Library  DateTime
#Variables   ../TestCases/TestSuiteVariables.robot

*** Variables ***

${Contact_Tab_E}    Id=Contact_Tab
${New_Button}     name=new
${Salutation_E}    Id=name_salutationcon2
${SpouseName_E}    Id=00Nf4000009here
${Mailing_Address_Street_E}    Id=con19street
${Continue/Save_E}    name=save
${FirstName_Contact_E}    Id=name_firstcon2
${LastName_Contact_E}    Id=name_lastcon2
${Deceased_Checkbox_E}    Id=00Nf4000009heqK
${Mailing_City_E}     Id=con19city
${Mailing_state_E}    Id=con19state
${Mailing_Zip_E}    Id=con19zip
${Mailing_Country_E}    Id=con19country
${Mailing_Address_Type_E}    Id=00Nf4000009her8
${Do Not Mail_Checkbox_E}    Id=00Nf4000009hepq
${Mail_Opt-Out_E}    Id=00Nf4000009her7
${MAil_Opt_Out_Date_E}    Id=00Nf4000009her6
${Email_E}          Id=con15
${Email_Status_E}    Id=00Nf4000009hep
${Don Not Email_E}        Id=00Nf4000009hepp
${Email_Opt_Out_Date_E}    Id=00Nf4000009hepw
${BirthDay_E}       Id=00Nf4000009hepb
${BirthMonth_E}     Id=00Nf4000009hepc
${BirthYear_E}      Id=00Nf4000009hepd
${BirthDateElement_E}        xpath=.//*[@id='con7']
${Head_of_Household_E}    Id=00Nf4000009heqM
${Preffered_Phone_E}      Id=00Nf4000009herR
${Primary_Phone_E}    Id=con10
${Mobile_Phone_E}    Id=con12
${Continue_E}     xpath=.//*[@id='bottomButtonRow']/input[1]
${Value}    TestMinistry
${EditButton_E}      xpath=.//*[@id='topButtonRow']/input[3]
${Table_Body}     xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody
${Table_Row}      tr

Contact Field Verification Webelements

${Contact_Name_VE}    xpath=.//*[@id='con2_ileinner']
${Account_Name_VE}    xpath=.//*[@id='con4_ileinner']
#${Account_Name2_E}    xpath=.//*[@id='con4_ileinner']
${Description_VE}    xpath=.//*[@id='con20_ileinner'}
${Primary_Phone_VE}     xpath=.//*[@id='con10_ileinner']
${Emai_VE}      xpath=.//*[@id='con15_ileinner']
${Exclude_from_Ministry_VE}     xpath=.//*[@id='00Nf4000009hepy_ileinner']
${Contact_Owner_VE}     xpath=.//*[@id='con1_ileinner']
${ADFMailOptout_VE}     xpath=.//*[@id='00Nf4000009hepQ_ileinner']
${AMFEMs_Opeout_VE}     xapth=.//*[@id='00Nf4000009hepR_ileinner']
${Faith&Justice_VE}     xpath=.//*[@id='00Nf4000009heq8_ileinner']
${Telemarketing_VE}     xpath=.//*[@id='00Nf4000009herm_ileinner']
${Record_Type}      xpath=.//*[@id='RecordType_ileinner']
${Head of Household_VE}     xpath=.//*[@id='00Nf4000009heqM_ileinner']



*** Keywords ***
Contact Creation
    Wait Until Element Is Visible    ${Contact_Tab_E}
    Click Element    ${Contact_Tab_E}
    Wait Until Element Is Visible    ${New_Button}
    Click Button    ${New_Button}
    Set Selenium Implicit Wait    20s
    Click Element    ${Continue_E}
    Set Selenium Implicit Wait    10s
    Set Selenium Speed    .10s
    Input Text    ${FirstName_Contact_E}   ${FirstName_V}
    Input Text    ${LastName_Contact_E}   ${LastName_V}
    Input Text    ${SpouseName_E}     ${SpouseName_V}
    #@{Salu}=    Get List Items    ${Salutation_E}
    #Select From List By Value    ${Salutation_E}    @{Salu}[0]
    Click Element    ${Deceased_Checkbox_E}
    Input Text    ${Mailing_Address_Street_E}    ${Mail_Street_V}
    Input Text    ${Mailing_City_E}    ${Mail_City_V}
    Input Text    ${Mailing_Country_E}    ${Mail_Country_V}
    Input Text    ${Mailing_state_E}    ${Mail_State_V}
    Input Text    ${Mailing_Zip_E}    ${Mail_Code_V}
    Click Element    ${Do Not Mail_Checkbox_E}
    Input Text    ${Email_E}    ${Contact_Email_V}
    Set Selenium Implicit Wait  5s
    Input Text      ${BirthDateElement_E}      ${Birth_Date_V}
    Click Element    ${Continue/Save_E}
Get values from Contact record
    ${contactName}=    Get Text    ${Contact_Name_VE}
    Set Global Variable    ${contactName}
    ${AccountName}=    Get Text    ${Account_Name_VE}
    Set Global Variable    ${AccountName}
    Should Be Equal  ${AccountName}      ${contactName} Household
    ${Cont_PreviousEmail}=    Get Text    xpath=.//*[@id='con15_ileinner']
    Set Global Variable    ${Cont_PreviousEmail}
    ${Primary_Phone}=    Get Text        ${Primary_Phone_VE}
    Set Global Variable  ${Primary_Phone}
    ${Contact_RecordType}=      Get Text    ${Record_Type}
    Set Global Variable  ${Contact_RecordType}
    ${Contact_Owner}=   Get Text        ${Contact_Owner_VE}
    Set Global Variable  ${Contact_Owner}
    ${Contact_Email}=   Get Text    ${Emai_VE}
    Set Global Variable  ${Contact_Email}
    ${ContactName}=     Get Text  ${Contact_Name_VE}




Houesehold_Contact_Field_Verification
    Get values from Contact record
    Should Be True  ${ADFMailOptout_VE}
    Should Be True  ${AMFEMs_Opeout_VE}
    Should Be True  ${Faith&Justice_VE}
    Should Be True  ${Telemarketing_VE}
    Should Be Equal  ${Primary_Phone_E}     ${MC_PrimaryPhone_V}
    Should Be Equal  ${Contact_Email}       ${MC_PrimaryEmail_V}
    Should Be Equal  ${ContactName}     ${MinstryFirsName}'+'${MininstryLastName}








Contact Field1 Verification
    Get values from Contact record
    Should Be True  ${ADFMailOptout_VE}
    Should Be True  ${AMFEMs_Opeout_VE}
    Should Be True  ${Faith&Justice_VE}
    Should Be True  ${Telemarketing_VE}
    Should Be Equal  ${Primary_Phone_E}     ${MC_PrimaryPhone_V}
    Should Be Equal  ${Contact_Email}       ${MC_PrimaryEmail_V}
    Should Be Equal  ${ContactName}     ${MinstryName_E}


Table_Iteration
    Sleep    10s
    ${Row_Count}=    Get Matching Xpath Count    xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr
    Log    ${Row_Count}
    : FOR    ${i}    IN RANGE    1    ${Row_Count}+1
    \    Log    ${i}
    \    ${GetTablevalue}=    Get Text    ${Table_Body}/${Table_Row}[${i}]/th
    \    Log    ${GetTablevalue}
    \    Run Keyword If    "${GetTablevalue}"=="${Value}"    Click Element    ${Table_Body}/${Table_Row}[${i}]/th/a
    \    Exit For Loop If    "${GetTablevalue}"=="${Value}"
    Click Element   ${EditButton_E}


ODP Contact Verification

    ${contactName}=    Get Text    ${Contact_Name_VE}
    Set Global Variable    ${contactName}
    ${AccountName}=    Get Text    ${Account_Name_VE}
    Set Global Variable    ${AccountName}
    Should Be Equal  ${AccountName}      ${contactName} Household
    ${Cont_PreviousEmail}=    Get Text    ${Emai_VE}
    Set Global Variable    ${Cont_PreviousEmail}


Ministry ODP Contact Verification

    ${contactName}=    Get Text    ${Contact_Name_VE}
    Set Global Variable    ${contactName}
    ${AccountName}=    Get Text    ${Account_Name_VE}
    Set Global Variable    ${AccountName}
    Should Be Equal  ${AccountName}      ${contactName} Household
    ${Cont_PreviousEmail}=    Get Text    ${Emai_VE}
    Set Global Variable    ${Cont_PreviousEmail}


Household Contact Verification

    ${contactName}=    Get Text    ${Contact_Name_VE}
    Set Global Variable    ${contactName}
    ${AccountName}=    Get Text    ${Account_Name_VE}
    Set Global Variable    ${AccountName}
    Should Be Equal  ${AccountName}      ${contactName} Household
    ${Cont_PreviousEmail}=    Get Text    ${Emai_VE}
    Set Global Variable    ${Cont_PreviousEmail}


Ministry Household Contact Verification

    ${contactName}=    Get Text    ${Contact_Name_VE}
    Set Global Variable    ${contactName}
    ${AccountName}=    Get Text    ${Account_Name_VE}
    Set Global Variable    ${AccountName}
    Should Be Equal  ${AccountName}      ${contactName} Household
    ${Cont_PreviousEmail}=    Get Text    ${Emai_VE}
    Set Global Variable    ${Cont_PreviousEmail}









