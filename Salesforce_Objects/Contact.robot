*** Settings ***
Documentation    Suite description
Library     Selenium2Library
Library     Screenshot
#Library     SeleniumLibrary
Library           Collections
Resource   ../TestCases/TestSuiteVariables.robot
#Library   ../TestCases/Table.robot
Library  DateTime


*** Variables ***
${TestcaseNo}
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
${Value}    JeanMSTQA_Church
${EditButton_E}      xpath=.//*[@id='topButtonRow']/input[3]
${Table_Body}     xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody
${Table_Row}      tr
${text}     JeanMSTQA_Church
${Cancel}         name=cancel
${Edit_Button}    name=edit
${Continue/Save}    name=save
${NickName_E}   xpath=.//*[@id='00Nf4000009herL']
${Home_Phone_E}  id=con13
${WorkPhone_E}    xpath=.//*[@id='00Nf4000009hes3']
${WorkPhone_Extension_E}   xpath=.//*[@id='00Nf4000009hes2']


# Table Iteration

${table xpath}    .//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody
${account}        xpath=.//*[@id='Account_Tab']/a
${Row}            tr
${Tabel row}      ${table xpath}/${Row}
&{Table}
${Column}         ${table xpath}/${Row}/td

#Contact_Field_Verification_Webelements

${Contact_Name_VE}    xpath=.//*[@id='con2_ileinner']
${Account_Name_VE}    xpath=.//*[@id='con4_ileinner']
#${Account_Name2_E}    xpath=.//*[@id='con4_ileinner']
${Description_VE}    xpath=.//*[@id='con20_ileinner'}
${Primary_Phone_VE}     xpath=.//*[@id='con10_ileinner']
${Emai_VE}      xpath=.//*[@id='con15_ileinner']
${Exclude_from_Ministry_VE}     xpath=.//*[@id='00Nf4000009hepy_ileinner']
${Contact_Owner_VE}     xpath=.//*[@id='con1_ileinner']
${ADFMailOptout_VE}     xpath=.//*[@id='00Nf4000009hepQ_chkbox']
${ADF_Foundation_Mail_OptOut_VE}     xapth=.//*[@id='00Nf400000ALtas_chkbox']
${Faith&Justice_VE}     xpath=.//*[@id='00Nf4000009heq8_chkbox']
${Telemarketing_VE}     xpath=.//*[@id='00Nf4000009herm_chkbox']
${Record_Type}      xpath=.//*[@id='RecordType_ileinner']
${Head of Household_VE}     xpath=.//*[@id='00Nf4000009heqM_chkbox']
${Membership_E}       xpath=//div[@id='00Nf400000AI7g0_ileinner']
${DonNot_Mail_VE}   xpath=.//*[@id='00Nf4000009hepq_chkbox']
${Greeting_Value_VE}  xpath=.//*[@id='00Nf4000009heqG_ileinner']
${Address_Value_VE}     xpath=.//*[@id='00Nf4000009hepX_ileinner']


#Relationship_Viewer_VF_Page

${Contact-Contact_VF_iframe_E}  title=sessionserver
${Frame_ID_VF_E}    id=066f4000001HaES
${Column_Header_CC_E}    xpath.//*[@id='tableAccount1']/thead/tr/th
${TestTest_E}   xpath=.//*[@id='pg:formid:block1:repeatAccount:3:account']/td[1]
${Contact_Softcrdeit_Checkbox_E}    xpath=.//*[@id='pg:formid:block1:repeatAccount:${i}:j_id39']/img
${i}
${New_single_Gift_E}    name=new_single_gift


*** Keywords ***
Contact Creation Without Salutation
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
    Input Text      ${NickName_E}   ${NickName_V}
    #Click Element    ${Deceased_Checkbox_E}
    Input Text    ${Mailing_Address_Street_E}    ${Mail_Street_V}
    Input Text    ${Mailing_City_E}    ${Mail_City_V}
    Input Text    ${Mailing_Country_E}    ${Mail_Country_V}
    Input Text    ${Mailing_state_E}    ${Mail_State_V}
    Input Text    ${Mailing_Zip_E}    ${Mail_Code_V}
    #Click Element    ${Do Not Mail_Checkbox_E}
    Input Text    ${Email_E}    ${Contact_Email_V}
    Set Selenium Implicit Wait  5s
    Input Text      ${BirthDateElement_E}      ${Birth_Date_V}
    Input Text      ${Preffered_Phone_E}    ${Preffered_Phone_V}
    Input Text      ${Home_Phone_E}     ${HomePhone_V}
    Input Text      ${Mobile_Phone_E}   ${Mobile_V}
    Input Text      ${workphone_e}      ${WorkPhone_V}
    Input Text      ${WorkPhone_Extension_E}    ${WorkPhone_Extension_V}
    Click Element    ${Continue/Save_E}

Contact Creation With Salutation
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
    @{Salu}=    Get List Items    ${Salutation_E}
    Select From List By Value    ${Salutation_E}    @{Salu}[2]
    Input Text      ${NickName_E}   ${NickName_V}
    #Click Element    ${Deceased_Checkbox_E}
    Input Text    ${Mailing_Address_Street_E}    ${Mail_Street_V}
    Input Text    ${Mailing_City_E}    ${Mail_City_V}
    Input Text    ${Mailing_Country_E}    ${Mail_Country_V}
    Input Text    ${Mailing_state_E}    ${Mail_State_V}
    Input Text    ${Mailing_Zip_E}    ${Mail_Code_V}
    Click Element    ${Do Not Mail_Checkbox_E}
    Input Text    ${Email_E}    ${Contact_Email_V}
    Input Text      ${Home_Phone_E}     ${HomePhone_V}
    Input Text      ${Mobile_Phone_E}   ${Mobile_V}
    Input Text      ${workphone_e}      ${WorkPhone_V}
    Input Text      ${WorkPhone_Extension_E}    ${WorkPhone_Extension_V}
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
    ${Primary_Phone}=    Get Value      ${Primary_Phone_VE}
    Set Global Variable  ${Primary_Phone}
    ${Contact_RecordType}=      Get Text    ${Record_Type}
    Set Global Variable  ${Contact_RecordType}
    ${Contact_Owner}=   Get Text        ${Contact_Owner_VE}
    Set Global Variable  ${Contact_Owner}
    ${Contact_Email}=   Get Text    ${Emai_VE}
    Set Global Variable  ${Contact_Email}
    ${ContactName}=     Get Text  ${Contact_Name_VE}

Verifying_Greeting_Field_Value
    Wait Until Element Is Visible  ${ADFMailOptout_VE}
    #Should Not Be True  ${ADFMailOptout_VE}
    #Should Not Be True  ${ADF_Foundation_Mail_OptOut_VE}
    #Should Not Be True  ${Faith&Justice_VE}
    #Should Not Be True  ${Telemarketing_VE}
    #Should Not Be True  ${DonNot_Mail_VE}
    Household/Reliance_Contact_Verification

Verifying_Addresse_Field_Value


Verify_Preffered_Phone_Value
    Household/Reliance_Contact_Verification

Houesehold_Contact_Communication_Field_Verification
    Get values from Contact record
    ${ADF_Checkbox}=     Get Value   ${ADFMailOptout_VE}
    Set Global Variable  ${ADF_Checkbox}
    ${ADF_Foundation_Checkbox}=     Get Value   ${ADF_Foundation_Mail_OptOut_VE}
    Set Global Variable     ${ADF_Foundation_Checkbox}
    ${FaithJustice_Checkbox}=     Get Value   ${Faith&Justice_VE}
    Set Global Variable     ${FaithJustice_Checkbox}
    ${Telemarketing}=       Get Value   ${Telemarketing_VE}
    Set Global Variable   ${Telemarketing}
    ${DoNotMail}=   Get Value   ${DonNot_Mail_VE}
    Set Global Variable  ${DoNotMail}
    Should Be Equal  ${ADF_Checkbox}     ${FALSE}
    Should Be Equal  ${ADF_Foundation_Checkbox}     ${FALSE}
    Should Be Equal  ${FaithJustice_Checkbox}     ${FALSE}
    Should Be Equal   ${Telemarketing}     ${FALSE}
    Should Be Equal  ${DoNotMail}   ${FALSE}


Houesehold_Contact_Checkbox_Field_Verification_Primary
    Get values from Contact record
    ${ADF_Checkbox}=     Get Value   ${ADFMailOptout_VE}
    Set Global Variable  ${ADF_Checkbox}
    ${ADF_Foundation_Checkbox}=     Get Value   ${ADF_Foundation_Mail_OptOut_VE}
    Set Global Variable     ${ADF_Foundation_Checkbox}
    ${FaithJustice_Checkbox}=     Get Value   ${Faith&Justice_VE}
    Set Global Variable     ${FaithJustice_Checkbox}
    ${Telemarketing}=       Get Value   ${Telemarketing_VE}
    Set Global Variable   ${Telemarketing}
    ${DoNotMail}=   Get Value   ${DonNot_Mail_VE}
    Set Global Variable  ${DoNotMail}
    Should Be Equal  ${ADF_Checkbox}     ${True}
    Should Be Equal  ${ADF_Foundation_Checkbox}     ${True}
    Should Be Equal  ${FaithJustice_Checkbox}     ${True}
    Should Be Equal   ${Telemarketing}     ${True}
    Should Be Equal  ${DoNotMail}   ${True}

Contact_Field_Verification

    Get values from Contact record
    Should Be True  ${ADFMailOptout_VE}
    Should Be True  ${ADF_Foundation_Mail_OptOut_VE}
    Should Be True  ${Faith&Justice_VE}
    Should Be True  ${Telemarketing_VE}
    #Should Be Equal  ${Primary_Phone_E}     ${MC_PrimaryPhone_V}
    #Should Be Equal  ${Contact_Email}       ${MC_PrimaryEmail_V}
    #Should Be Equal  ${ContactName}     ${MinstryName_E}


Contact_Table_Iteration

    Sleep    10s
    ${Row_Count}=    Get Matching Xpath Count    xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr
    Log    ${Row_Count}
    : FOR    ${i}    IN RANGE    1    ${Row_Count}+1
    \    Log    ${i}
    \    ${GetTablevalue}=    Get Text    ${Table_Body}/${Table_Row}[${i}]/th
    \    Log    ${GetTablevalue}
    \    Run Keyword If    "${GetTablevalue}"=="Test Demo"    Click Element    ${Table_Body}/${Table_Row}[${i}]/th/a
    \    Exit For Loop If    "${GetTablevalue}"=="Test Demo"
    Sleep    10s
    Wait Until Element Is Visible  ${EditButton_E}
    Click Element   ${EditButton_E}


ODP_Contact_Verification

    Wait Until Element Is Visible    ${Contact_Tab_E}
    Click Element    ${Contact_Tab_E}
    Sleep    10s
    Click Element   xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a
    Wait Until Element Is Visible    name=edit
    ${contactName}=    Get Text    ${Contact_Name_VE}
    Set Global Variable    ${contactName}
    Should Be Equal  ${contactName}     ${ChurchName_V}
    ${AccountName}=    Get Text    ${Account_Name_VE}
    Set Global Variable    ${AccountName}
    Should Be Equal  ${AccountName}     ${ChurchName_V}
    ${Membership}=    Get Text    ${Membership_E}
    Should Be Equal  ${Membership}      Church Alliance
    Contact_Field_Verification



Ministry_ODP_Contact_Verification

    ${contactName}=    Get Text    ${Contact_Name_VE}
    Set Global Variable    ${contactName}
    ${AccountName}=    Get Text    ${Account_Name_VE}
    Set Global Variable    ${AccountName}
    Should Be Equal  ${AccountName}      ${contactName} Household
    ${Cont_PreviousEmail}=    Get Text    ${Emai_VE}
    Set Global Variable    ${Cont_PreviousEmail}


Household/Reliance_Contact_Verification

    ${contactName}=    Get Text    ${Contact_Name_VE}
    Set Global Variable    ${contactName}
    ${AccountName}=    Get Text    ${Account_Name_VE}
    Set Global Variable    ${AccountName}
    Should Be Equal  ${AccountName}      ${contactName} Household
    ${Cont_PreviousEmail}=    Get Text    ${Emai_VE}
    Set Global Variable    ${Cont_PreviousEmail}
    ${Greeting_Value}=  Get Text    ${Greeting_Value_VE}
    Set Global Variable  ${Greeting_Value}
    ${Address_Value}=   Get Text    ${Address_Value_VE}
    Set Global Variable  ${Address_Value}
    ${Primary_Phone}=   Get Value   ${Primary_Phone_VE}
    Set Global Variable  ${Primary_Phone}
    ${Greeting_String1}=     Catenate    Mr.     ${Greeting_Value}
    Set Global Variable   ${Greeting_String1}
    ${Gretting_String2}=     catenate    ${FirstName_V}  ${SpouseName_V}
    Set Global Variable   ${Gretting_String2}
    ${String3}=     Catenate  Mr.   ${ContactName}
    Set Global Variable  ${String3}
    ${WorkPhone}=   Catenate    SEPARATOR= X     ${WorkPhone_V}  ${WorkPhone_Extension_V}
    Set Global Variable  ${WorkPhone}

Church_Household_Contact_Verification

    ${contactName}=    Get Text    ${Contact_Name_VE}
    Set Global Variable    ${contactName}
    ${AccountName}=    Get Text    ${Account_Name_VE}
    Set Global Variable    ${AccountName}
    Should Be Equal  ${AccountName}      ${contactName} Household
    ${Cont_PreviousEmail}=    Get Text    ${Emai_VE}
    Set Global Variable    ${Cont_PreviousEmail}

Ambassdor_Household Contact Verification

    ${contactName}=    Get Text    ${Contact_Name_VE}
    Set Global Variable    ${contactName}
    ${AccountName}=    Get Text    ${Account_Name_VE}
    Set Global Variable    ${AccountName}
    Should Be Equal  ${AccountName}      ${contactName} Household
    ${Cont_PreviousEmail}=    Get Text    ${Emai_VE}
    Set Global Variable    ${Cont_PreviousEmail}

Test

  Sleep    10s
    ${Row_Count}=    Get Matching Xpath Count    xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr
    Log    ${Row_Count}
    : FOR    ${i}    IN RANGE    1    ${Row_Count}+1
    \    Log    ${i}
    \    ${GetTablevalue}=    Get Text    ${Table_Body}/${Table_Row}[${i}]/th
    \    Run Keyword   "${GetTablevalue}"=="${Value}"   Click Link   ${Table_Body}/${Table_Row}[${i}]/th/a
    \    Exit For Loop If    "${GetTablevalue}"=="${Value}"
    Wait Until Element Is Visible  ${EditButton_E}
    Click Element   ${EditButton_E}



Related Addres_Related List_From_Contact
    ${RA_Relate list}=    Get Matching Xpath Count    xpath=.//*[@id='0031b00000RyUIX_00Nf400000AI7r3_body']/table/tbody/tr
    Log    ${RA_Relate list}
    ${RA-Col_Count}=    Get Matching Xpath Count    xpath=.//*[@id='0031b00000RyUIX_00Nf400000AI7r3_body']/table/tbody/tr[1]/th
    Log    ${RA-Col_Count}
    : FOR    ${k}    IN RANGE    1    ${RA_Relate list}+1
    \    Log    ${k}
    \    Run Keyword If    ${k}!=2    Continue For Loop
    : FOR    ${J}    IN RANGE    2    ${RA-Col_Count}+1
    \    Log    ${J}
    \    ${GetTablevalue}=    Get Text    xpath=.//*[@id='0031b00000RyUIX_00Nf400000AI7r3_body']/table/tbody/tr[${k}]/td[${J}]
    \    Log    ${GetTablevalue}
    \    Click Element    xpath=.//*[@id='0031b00000RyUIX_00Nf400000AI7r3_body']/table/tbody/tr[${k}]/td[${J}]/a
    \    Exit For Loop

Related Email_RelatedList_From_Contact
    ${RE_Relate list}=    Get Matching Xpath Count    xpath=..//*[@id='0031b00000RyUIX_00Nf4000009henH_body']/table/tbody/tr
    Log    ${RE_Relate list}
    ${RE-Col_Count}=    Get Matching Xpath Count    xpath=.//*[@id='0031b00000RyUIX_00Nf4000009henH_body']/table/tbody/tr[1]/th
    Log    ${RE-Col_Count}
    : FOR    ${k}    IN RANGE    1    ${RE_Relate list}+1
    \    Log    ${k}
    \    Run Keyword If    ${k}!=${RE_Relate list}    Continue For Loop
    \    ${GetTablevalue}=    Get Text    xpath=.//*[@id='0031b00000RyUIX_00Nf4000009henH_body']/table/tbody/tr[${k}]/th
    \    Log    ${GetTablevalue}
    \    Click Element    xpath=.//*[@id='0031b00000RyUIX_00Nf4000009henH_body']/table/tbody/tr[${k}]/th/a
    \    Exit For Loop If    ${k}!=${RE_Relate list}

Related_Email_Verification

    Houesehold_Contact_Checkbox_Field_Verification_Primary
    Wait Until Element Is Visible    xpath=.//*[@id='Name_ileinner']
    ${RE_Email}=    Get Text    xpath=.//*[@id='Name_ileinner']
    Log    ${RE_Email}
    Should Be Equal    ${RE_Email}  ${Cont_PreviousEmail}
    Close Browser

Contact_Exsting_Address

    ${RA_PreviousStreet}=    Get Text    ${Mailing_Address_Street_E}
    Set Global Variable  ${RA_PreviousStreet}
    Input Text    ${Mail_Street_V}

Uncheck_Head_Of_Household_Flag

    Click Button    ${Edit_Button}
    Wait Until Element Is Enabled    xpath=.//*[@id='00Nf4000009heqM']
    Unselect Checkbox    xpath=.//*[@id='00Nf4000009heqM']
    Click Button    ${Continue/Save_E}
    ${Alert}=    Get Text    xpath=.//*[@id='errorDiv_ep']
    Log    ${Alert}
    Take Screenshot Without Embedding
    Element Should Not Be Visible    ${Edit_Button}
    Click Button    ${Cancel}

Head_Of_Household_Verifcation_For_SecondContact
    ${HOH}=     Get Value   ${Head of Household_VE}
    Set Global Variable  ${HOH}
    Should Be Equal  ${HOH}     ${False}




Contact_Relationship_Viewer

    Select Frame  ${frame_id_vf_e}
    @{DonationRole}=    Create List
    ${Row Count}=    Get Matching Xpath Count    xpath=.//*[@id='tableAccount1']/tbody/tr
    ${rc_int}=    Convert To Integer    ${Row Count}
    ${Column_Count}=    Get Matching Xpath Count    ${Column_Header_CC_E}
    ${cc_int}=    Convert To Integer    ${Column_Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    Set Global Variable   ${i}
    \    ${ContactRelValue}=    Get Value    xpath=.//*[@id='pg:formid:block1:repeatAccount:${i}:account']/td[1]/a[3]
    \    Append To List  @{DonationRole}    Log    ${ContactRelValue}
    \    Run Keyword If    "${Contact_Softcrdeit_Checkbox_E}"=="${True}"    Validating_SoftCredit_Role_From_ContactVF_Page
    \    Exit For Loop If  ${i}<<${rc_int}+1

Get_Value_From_Table

    ${ContactRelValue}=    Get Value    xpath=.//*[@id='pg:formid:block1:repeatAccount:${i}:account']/td[1]/a[3]

Donation_Creation_From_Contact
    Wait Until Element Is Visible    ${Contact_Tab_E}
    Click Element    ${Contact_Tab_E}
    Sleep    10s
    Click Element   xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a
    Wait Until Element Is Visible    name=edit
    Click Element  ${New_single_Gift_E}
