*** Settings ***
Documentation    Suite description
Library     Selenium2Library
Library  Screenshot
Library  Collections
Resource   ../TestCases/TestSuiteVariables.robot
#Variables  ../TestCases/TestSuiteVariables.robot
Resource  ../Salesforce_Objects/Contact.robot
Resource  ../Common_Configuration/ExecuteJS.robot

*** Variables ***

${Donation_Name_E}    Id=opp3
${Donor_E}          Id=CF00Nf4000009heuH
${Stage_E}          Id=opp11
${Amount_E}         Id=opp7
${CloseDate_E}      Id=opp9
${Type_E}           Id=opp5
${SourceCode_E}     Id=00Nf4000009hevN
${Opportunity_Tab_E}    xpath=.//*[@id='Opportunity_Tab']/a
${Continue_E}     xpath=.//*[@id='bottomButtonRow']/input[1]
${New_Button_E}     name=new
${Edit_Button}    name=edit
${Continue/Save}    name=save

#Field Verification Webelements

${Donation_Name_VE}     xpath=.//*[@id='opp3_ileinner']
${Donor_VE}     xpath=.//*[@id='CF00Nf4000009heuH_ileinner']
${Account_VE}       xpath=.//*[@id='opp4_ileinner']
${Source_Code_VE}       xpath=.//*[@id='00Nf4000009hevN_ileinner']
${DonorContactRole}    Donor
${Donor_update_Value}   Kerry Dennis
#Transaction record webelements
${Tracnsaction_Related_List_E}      xpath=.//*[@id='006q000000FFNJI_00Nf400000AHy7G']/div[1]/div
${Transction_Type_E}        xpath=.//*[@id='006q000000FFNJI_00Nf400000AHy7G_body']/table/tbody/tr[2]/td[3]
${Transaction_Amount}       xpath=.//*[@id='006q000000FFNJI_00Nf400000AHy7G_body']/table/tbody/tr[2]/td[5]
${Transaction_Message}      xpath=.//*[@id='006q000000FFNJI_00Nf400000AHy7G_body']/table/tbody/tr[2]/td[2]
${Transaction_ID_E}     xpath=.//*[@id='006q000000FFNJI_00Nf400000AHy7G_body']/table/tbody/tr[2]/th

#Contact Role Verification

${Record}   xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a
${Contact_Role_Frame_E}     id=066f4000001HGzX
${ContactVF_Table_Row_E}       xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']
${ContactVF_Table_Coln_E}   xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]/th
${Edit_ContactRole_Button_E}    css=[value='Edit Contact Roles']
${Save_Button_E}    css=[value="Save"]
${Cancel_Button_E}  css=[value='Cancel']
${Edit_Role_VFPage_Frame}   id=thePage:theForm
${Lookup_Icon_E}    xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:4:contactInput_lkwgt']/img
${Frame_Lookup}     id=resultsFrame
${Role_Txt}     Brandon Reeves
${Child_Window_E}   title=Search ~ Salesforce - Enterprise Edition
${Parent_Window_E}   title=Salesforce - Enterprise Edition
${Contact_Role_Table_E}   xpath=.//*[@id='new']/div/div[2]/div/div[2]/table/tbody
${i}
${SoftCredtit_Amount}   Partial|Full
${UsernameElement}      Id=username
${PasswordElement}      Id=password
${Submit}       Id=Login
${URL} =  https://test.salesforce.com
${ContactRelValue}
@{DonationRole}
${Contact_Softcrdeit_Checkbox_E}    xpath=.//*[@id='pg:formid:block1}:repeatAccount:1:j_id39']/img


*** Keywords ***
Donation_Creation
    Click Element    ${Opportunity_Tab_E}
    Click Element    ${New_Button_E}
    Set Selenium Implicit Wait    20s
    Click Element    ${Continue_E}
    Input Text    ${Donation_Name_E}    ${Don_Name_V}
    Input Text    ${Amount_E}    ${Don_Amt_V}
    Input Text    ${SourceCode_E}    ${Don_Sourcecode_V}
    Input Text    ${Donor_E}    ${Don_Donor_V}
    @{Stage1}=    Get List Items    ${Stage_E}
    Select From List By Value    ${Stage_E}    @{Stage1}[4]
    @{Type1}=    Get List Items    ${Type_E}
    Select From List By Value    ${Type_E}    @{Type1}[1]
    Input Text    ${CloseDate_E}    ${Don_Date_V}
    Click Link    xpath=.//*[@id='ep']/div[2]/div[3]/table/tbody/tr[7]/td[2]/div/span/span/a
    Click Element    ${Continue_E}
    #Verify the ODP Contact


Donation_Contact_Role_Verification
    ${DonorValue}=    Get Text   ${Donor_VE}
    Log    ${DonorValue}
    ${DonationAccountValue}=    Get Text   ${Account_VE}
    Log    ${DonationAccountValue}
    Select Frame    ${Contact_Role_Frame_E}
    ${Table}=    Get Value    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']
    Log To Console    ${Table}
    ${ContactRoleHeader}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]
    Log    ${ContactRoleHeader}
    ${Row Count}=    Get Matching Xpath Count   ${ContactVF_Table_Row_E}
    ${rc_int}=    Convert To Integer    ${Row Count}
    ${Column_Count}=    Get Matching Xpath Count    ${ContactVF_Table_Coln_E}
    ${cc_int}=    Convert To Integer    ${Column_Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    ${DonorRole}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]
    \    Continue For Loop If    ${i}<<${rc_int}+1
    : FOR    ${j}    IN RANGE    2    ${cc_int}+1
    \    Log    ${j}
    \    ${ContactRoleValue}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[${j}]
    \    Log    ${ContactRoleValue}
    \    Should Be Equal    ${ContactRoleValue}    ${DonorValue}
    \    ${Role}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[${5}]
    \    ${ContacrRoleAmount}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[${6}]
    \    Should Be Equal    ${ContacrRoleAmount}    Full
    \    ${ContactRoleAccount}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[${3}]
    \    Should Be Equal    ${ContactRoleAccount}    ${DonationAccountValue}
    \    Run Keyword If    "${Role}"=="${DonorContactRole}"    Should Be Equal    ${Role}    ${DonorContactRole}
    \    Run Keyword If    "${Role}"!="${DonorContactRole}"    Contact_Relationship_Viewer
    \    Continue For Loop If    ${i}<<${rc_int}+1


Updating_the_Donor_Value

    Click Element    ${Opportunity_Tab_E}
    Wait Until Element Is Visible    xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a
    Click Element    xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a
    Wait Until Element Is Visible    ${Edit_Button}
    ${DonationNameBefore}=    Get Text    Id=opp3_ileinner
    Click Element    ${Edit_Button}
    Clear Element Text   ${Donor_E}
    Input Text   ${Donor_E}    ${Donor_update_Value}
    Click Button    ${Continue/Save}
    Wait Until Element Is Visible    ${Edit_Button}
    ${DonationNameAfter}=    Get Text    Id=opp3_ileinner
    Log    ${DonationNameAfter}
    Should Not Be Equal    ${DonationNameBefore}    ${DonationNameAfter}
    Log    Pass
    ${Row Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']
    ${rc_int}=    Convert To Integer    ${Row Count}
    ${Column_Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]/th
    ${cc_int}=    Convert To Integer    ${Column_Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    ${ContactRoleValue}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[2]
    \    Log    ${ContactRoleValue}
    \    Run Keyword If    "${ContactRoleValue}"=="${DonorValue}"    Should Be Equal    ${ContactRoleValue}    Test Apirl_Account_4
    Take Screenshot


Donation_Designation_VF_verification

    Click Element    ${Opportunity_Tab_E}
    Set Selenium Implicit Wait    10s
    Click Element    xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a
    Set Selenium Implicit Wait    20s
    Select Frame    id=066f4000001HGzZ
    ${Table}=    Get Value    xpath=.//*[@id='container']
    Log To Console    ${Table}
    ${Available_Des}=    Get Value    xpath=.//*[@id='example']/tbody/tr
    Log To Console    ${Available_Des}
    Click Element    xpath=.//*[@id='example']/tbody
    ${Row Count}=    Get Matching Xpath Count    xpath=.//*[@id='example']/tbody/tr
    ${rc_int}=    Convert To Integer    ${Row Count}
    : FOR    ${i}    IN RANGE    2    ${rc_int}+1
    \    Log    ${i}
    \    ${Getvalue}=    Get Text    xpath=.//*[@id='example']/tbody/tr[${i}]
    \    Log    ${Getvalue}
    \    Run Keyword If    "${Getvalue}"==" Designation2"    Click Element    xpath=.//*[@id='example']/tbody/tr[${i}]/td/input
    \    Exit For Loop If    "${Getvalue}"==" Designation2"
    Click Element    xpath=.//*[@id='right']
    ${TotalAmount}=    Get Text    xpath=.//*[@id='right']/label[1]
    Log    ${TotalAmount}
    ${DesignatedAmt}=    Get Text    xpath=.//*[@id='right']/label[2]
    Log    ${DesignatedAmt}
    ${UnDegAmount}=    Get Text    xpath=.//*[@id='right']/label[3]
    Log    ${UnDegAmount}
    Should Be Equal    ${TotalAmount}    ${DesignatedAmt}
    Screenshot.Take Screenshot Without Embedding
    Screenshot.Set Screenshot Directory    E:\\Desktop\\ADF_Project\\Screenshots

Donation_Donor_Role_Verification

    Wait Until Element Is Visible    ${Opportunity_Tab_E}
    Click Element    ${Opportunity_Tab_E}
    Set Selenium Implicit Wait    10s
    Click Element       ${Record}
    Set Selenium Implicit Wait    20s
    ${DonorValue}=    Get Text    xpath=.//*[@id='CF00Nf4000009heuH_ileinner']
    Log    ${DonorValue}
    ${DonationAccountValue}=    Get Text    xpath=.//*[@id='opp4_ileinner']
    Log    ${DonationAccountValue}
    Select Frame    id=066f4000001HGzX
    ${Table}=    Get Value    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']
    Log To Console    ${Table}
    ${ContactRoleHeader}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]
    Log    ${ContactRoleHeader}
    ${Row Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']
    ${rc_int}=    Convert To Integer    ${Row Count}
    ${Column_Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]/th
    ${cc_int}=    Convert To Integer    ${Column_Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    ${ContactRoleValue}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[2]
    \    Log    ${ContactRoleValue}
    \    Run Keyword If    "${ContactRoleValue}"=="${DonorValue}"    Should Be Equal    ${ContactRoleValue}    ${DonorValue}
    \    ${ContactRoleAccount}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[3]
    \    Run Keyword If    "${ContactRoleAccount}"=="${DonationAccountValue}"    Should Be Equal    ${ContactRoleAccount}    ${DonationAccountValue}
    \    ${Role}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[5]
    \    Run Keyword If    "${Donor}"=="${ContactRoleValue}"    Should Be Equal    ${Role}    ${DonorContactRole}
    \    Run Keyword If    "${Role}"!="${DonorContactRole}"    Should Be Equal    ${Role}    Soft Credit
    \    ${ContacrRoleAmount}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[6]
    \    Should Be Equal    ${ContacrRoleAmount}    Full


Add_New_Single_Contact_Role

    Wait Until Element Is Visible    ${Opportunity_Tab_E}
    Click Element    ${Opportunity_Tab_E}
    Set Selenium Implicit Wait    10s
    Click Element       ${Record}
    Set Selenium Implicit Wait    20s
    ${DonorValue}=    Get Text    xpath=.//*[@id='CF00Nf4000009heuH_ileinner']
    Log    ${DonorValue}
    ${DonationAccountValue}=    Get Text    xpath=.//*[@id='opp4_ileinner']
    Log    ${DonationAccountValue}
    Select Frame    ${Contact_Role_Frame_E}
    Click Button  ${Edit_ContactRole_Button_E}
    Set Selenium Implicit Wait  5s
    #Select Frame  ${Edit_Role_VFPage_Frame}
    #Click Element  ${Lookup_Icon_E}
    #Window_Handler_Donation_Role
    #Select Frame  ${Edit_ContactRole_Button_E}
    ${Table_Role}=  Get Matching Xpath Count  xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:tb']
    Log  ${Table_Role}
    ${Row_Count}=    Get Matching Xpath Count  xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:tb']/tr
    ${rc_int}=    Convert To Integer    ${Row Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    Set Global Variable  ${i}
    \    ${ContactRoleValue}=   Get Value   xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:${i}:contactInput']
    \    Log    ${ContactRoleValue}
    \    Run Keyword If  "${ContactRoleValue}"=="${EMPTY}"  Insert_New_Contact
    \    ${ContactRoleValue1}=   Get Value   xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:${i}:contactInput']
    \    Log    ${ContactRoleValue1}
    \    Run Keyword If    "${ContactRoleValue1}"=="${Role_Txt}"     Selecting_Contact_Role
    \    Run Keyword If    "${ContactRoleValue1}"=="${Role_Txt}"  Entering_Amount_contact_Role
    \    Run Keyword If  "${ContactRoleValue1}"=="${Role_Txt}"   Click Button  ${Save_Button_E}
    \    Exit For Loop If  "${ContactRoleValue1}"=="${Role_Txt}"
    Set Selenium Implicit Wait  15s
    Select Frame    ${Contact_Role_Frame_E}
    ${Table}=    Get Value    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']
    Log To Console    ${Table}
    ${ContactRoleHeader}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]
    Log    ${ContactRoleHeader}
    ${Row Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr
    ${rc_int}=    Convert To Integer    ${Row Count}
    ${Column_Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]/th
    ${cc_int}=    Convert To Integer    ${Column_Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    ${ContactRoleValue}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[2]
    \    Log    ${ContactRoleValue}
    \    Run Keyword If    "${ContactRoleValue}"=="${DonorValue}"    Should Be Equal    ${ContactRoleValue}    ${DonorValue}
    \    ${ContactRoleAccount}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[3]
    \    Run Keyword If    "${ContactRoleAccount}"=="${DonationAccountValue}"    Should Be Equal    ${ContactRoleAccount}    ${DonationAccountValue}
    \    ${Role}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[5]
    \    Run Keyword If    "${ContactRoleValue}"=="${DonorValue}"    Should Be Equal    ${Role}    ${DonorContactRole}
    \    Run Keyword If    "${ContactRoleValue}"!="${DonorValue}"    Should Be Equal    ${Role}    Soft Credit
    \    ${ContacrRoleAmount}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[6]
    \    Run Keyword If    "${ContactRoleValue}"=="${DonorValue}"    Should Be Equal    ${ContacrRoleAmount}    Full
    \    Run Keyword If    "${ContactRoleValue}"!="${DonorValue}"    Should Contain    ${SoftCredtit_Amount}


Window_Handler_Donation_Role

    Set Selenium Implicit Wait  10s
    Click Element  ${Lookup_Icon_E}
    Select Window  ${Child_Window_E}
    ${DonationRoel_Lookup}=    Get Title
    Log To Console    ${DonationRoel_Lookup}
    Set Selenium Implicit Wait  10s
    Select Frame    ${Frame_Lookup}
    Log    nullllll
    Click Element    ${Contact_Role_Table_E}
    ${Row Count}=    Get Matching Xpath Count    ${Contact_Role_Table_E}/tr
    : FOR    ${i}    IN RANGE    1    ${Row Count}+1
    \    Log    ${i}
    \    ${Getvalue}=    Get Text    ${Contact_Role_Table_E}/tr[${i}]/th
    \    Log    ${Getvalue}
    \    Run Keyword If    "${Getvalue}"=="${Role_Txt}"   Click Link  ${Contact_Role_Table_E}/tr[${i}]/th
    \    Run Keyword If    "${Getvalue}"=="${Role_Txt}"   Close Window
    \    Exit For Loop If    "${Getvalue}"=="${Role_Txt}"
    Select Window  ${Parent_Window_E}
    Set Selenium Implicit Wait  10s

Selecting_Contact_Role

    @{Role}=   Get List Items     xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:${i}:roleInput']
    Select From List By Value     xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:${i}:roleInput']    @{Role}[1]

Entering_Amount_contact_Role

    Clear Element Text  xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:${i}:pagAmountFields']/input[1]
    Input Text  xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:${i}:pagAmountFields']/input[1]     500

Insert_New_Contact
    Input Text  xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:${i}:contactInput']   ${Role_Txt}

Add_New_Multiple_Contact_Role

    Wait Until Element Is Visible    ${Opportunity_Tab_E}
    Click Element    ${Opportunity_Tab_E}
    Set Selenium Implicit Wait    10s
    Click Element       ${Record}
    Set Selenium Implicit Wait    20s
    ${DonorValue}=    Get Text    xpath=.//*[@id='CF00Nf4000009heuH_ileinner']
    Log    ${DonorValue}
    ${DonationAccountValue}=    Get Text    xpath=.//*[@id='opp4_ileinner']
    Log    ${DonationAccountValue}
    Select Frame    ${Contact_Role_Frame_E}
    Click Button  ${Edit_ContactRole_Button_E}
    Set Selenium Implicit Wait  5s
    #Select Frame  ${Edit_Role_VFPage_Frame}
    #Click Element  ${Lookup_Icon_E}
    #Window_Handler_Donation_Role
    #Select Frame  ${Edit_ContactRole_Button_E}
    ${Table_Role}=  Get Matching Xpath Count  xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:tb']
    Log  ${Table_Role}
    ${Row_Count}=    Get Matching Xpath Count  xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:tb']/tr
    ${rc_int}=    Convert To Integer    ${Row Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    Set Global Variable  ${i}
    \    ${ContactRoleValue}=   Get Value   xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:${i}:contactInput']
    \    Log    ${ContactRoleValue}
    \    Run Keyword If  "${ContactRoleValue}"=="${EMPTY}"  Insert_New_Contact
    \    ${ContactRoleValue1}=   Get Value   xpath=.//*[@id='thePage:theForm:thePageBlock:theTable:${i}:contactInput']
    \    Log    ${ContactRoleValue1}
    \    Run Keyword If    "${ContactRoleValue1}"=="${Role_Txt}"     Selecting_Contact_Role
    \    Run Keyword If    "${ContactRoleValue1}"=="${Role_Txt}"  Entering_Amount_contact_Role
    \    Run Keyword If  "${ContactRoleValue1}"=="${Role_Txt}"   Click Button  ${Save_Button_E}
    \    Exit For Loop If  ${i}<<${rc_int}+1
    Set Selenium Implicit Wait  15s
    Select Frame    ${Contact_Role_Frame_E}
    ${Table}=    Get Value    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']
    Log To Console    ${Table}
    ${ContactRoleHeader}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]
    Log    ${ContactRoleHeader}
    ${Row Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr
    ${rc_int}=    Convert To Integer    ${Row Count}
    ${Column_Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]/th
    ${cc_int}=    Convert To Integer    ${Column_Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    ${ContactRoleValue}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[2]
    \    Log    ${ContactRoleValue}
    \    Run Keyword If    "${ContactRoleValue}"=="${DonorValue}"    Should Be Equal    ${ContactRoleValue}    ${DonorValue}
    \    ${ContactRoleAccount}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[3]
    \    Run Keyword If    "${ContactRoleAccount}"=="${DonationAccountValue}"    Should Be Equal    ${ContactRoleAccount}    ${DonationAccountValue}
    \    ${Role}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[5]
    \    Run Keyword If    "${ContactRoleValue}"=="${DonorValue}"    Should Be Equal    ${Role}    ${DonorContactRole}
    \    Run Keyword If    "${ContactRoleValue}"!="${DonorValue}"    Should Be Equal    ${Role}    Soft Credit
    \    ${ContacrRoleAmount}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[6]
    \    Run Keyword If    "${ContactRoleValue}"=="${DonorValue}"    Should Be Equal    ${ContacrRoleAmount}    Full
    \    Run Keyword If    "${ContactRoleValue}"!="${DonorValue}"    Should Contain    ${SoftCredtit_Amount}




Donation_SoftCredit_Role_Verification_From_ContactVF

    Wait Until Element Is Visible    ${Opportunity_Tab_E}
    Click Element    ${Opportunity_Tab_E}
    Set Selenium Implicit Wait    10s
    Click Element       ${Record}
    Set Selenium Implicit Wait    20s
    ${DonorValue}=    Get Text    xpath=.//*[@id='CF00Nf4000009heuH_ileinner']
    Log    ${DonorValue}
    ${DonationAccountValue}=    Get Text    xpath=.//*[@id='opp4_ileinner']
    Log    ${DonationAccountValue}
    Select Frame    id=066f4000001HGzX
    ${Table}=    Get Value    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']
    Log To Console    ${Table}
    ${ContactRoleHeader}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]
    Log    ${ContactRoleHeader}
    ${Row Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr
    ${rc_int}=    Convert To Integer    ${Row Count}
    ${Column_Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]/th
    ${cc_int}=    Convert To Integer    ${Column_Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    ${ContactRoleValue}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[2]
    \    Log    ${ContactRoleValue}
    \    Run Keyword If    "${ContactRoleValue}"=="${DonorValue}"    Should Be Equal    ${ContactRoleValue}    ${DonorValue}
    \    ${ContactRoleAccount}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[3]
    \    Run Keyword If    "${ContactRoleAccount}"=="${DonationAccountValue}"    Should Be Equal    ${ContactRoleAccount}    ${DonationAccountValue}
    \    ${Role}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[5]
    \    Run Keyword If    "${DonorValue}"=="${ContactRoleValue}"    Should Be Equal    ${Role}    ${DonorContactRole}
    \    Run Keyword If    "${Role}"!="${DonorContactRole}"    Validating_SoftCredit_Role_From_ContactVF_Page
    \    Continue For Loop If    ${i}<<${rc_int}+1








Validating_SoftCredit_Role_From_ContactVF_Page

    Append To List  @{DonationRole} ${ContactRelValue}


Validating_SoftCredit_Role_From_ContactVF_Page1

    Should Be Equal  @{DonationRole}     ${ContactRelValue}

Contact_Relationship_Viewer

    ${Row Count}=    Get Matching Xpath Count    xpath=.//*[@id='tableAccount1']/tbody/tr
    ${rcc_int}=    Convert To Integer    ${Row Count}
    ${Column1_Count}=    Get Matching Xpath Count    ${Column_Header_CC_E}
    ${cc1_int}=    Convert To Integer    ${Column1_Count}
    : FOR    ${j}    IN RANGE    1    ${rcc_int}+1
    \    Log    ${j}
    \    Set Global Variable   ${j}
    \    ${ContactRelValue}=    Get Value    xpath=.//*[@id='pg:formid:block1:repeatAccount:${j}:account']/td[1]/a[3]
    \    Log    ${ContactRelValue}
    \    Run Keyword If    "${Contact_Softcrdeit_Checkbox_E}"=="${True}"    Validating_SoftCredit_Role_From_ContactVF_Page
    \    Exit For Loop If  ${j}<<${rcc_int}+1


Get_Value_From_Table

    ${ContactRelValue}=    Get Value    xpath=.//*[@id='pg:formid:block1:repeatAccount:${i}:account']/td[1]/a[3]
    Append To List  @{DonationRole}    Log    ${ContactRelValue}


Contact_Relationship_Viewer1

    Select Frame  ${frame_id_vf_e}
    Wait Until Element Is Visible  id=pg:formid:block1
    @{DonationRole}=    Create List
    Wait Until Element Is Visible  xpath=.//*[@id='tableAccount1']/tbody/tr
    ${Row Count}=    Get Matching Xpath Count    xpath=.//*[@id='tableAccount1']/tbody/tr
    ${rc_int}=    Convert To Integer    ${Row Count}
    ${Column_Count}=    Get Matching Xpath Count    ${Column_Header_CC_E}
    ${cc_int}=    Convert To Integer    ${Column_Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    Set Global Variable   ${i}
    \    ${ContactRelValue}=    Get Text    xpath=.//*[@id='pg:formid:block1:repeatAccount:${i}:account']/td[1]/a[3]
    \    Log    ${ContactRelValue}
    \    Run Keyword If     "${Contact_Softcrdeit_Checkbox_E}"=="${True}"    Validating_SoftCredit_Role_From_ContactVF_Page
    \    Exit For Loop If  ${i}>>${rc_int}+1
    set selenium implicit wait  20s
    Scroll Page To Location    100    5000
    #Focus  xpath=.//*[@id='0031b00000RyUIX_RelatedOpportunityList']/div[1]/div
    #Scroll_Page
    #Go To  xpath=.//*[@id='0031b00000RyUIX_RelatedOpportunityList']/div[1]/div
    Sleep   20s
    Wait Until Page Contains Element  xpath=.//*[@id='0031b00000RyUIX_RelatedOpportunityList']/div[1]/div/div[1]/table/tbody/tr/td[2]/input[1]
    Click Element  xpath=.//*[@id='0031b00000RyUIX_RelatedOpportunityList']/div[1]/div/div[1]/table/tbody/tr/td[2]/input[1]
    Wait Until Element Is Visible  ${Amount_E}
    Input Text    ${Amount_E}    5000
    Input Text    ${SourceCode_E}    10000878
    Click Element    ${Continue_E}
    Set Selenium Implicit Wait    20s
    ${DonorValue}=    Get Text    xpath=.//*[@id='CF00Nf4000009heuH_ileinner']
    Log    ${DonorValue}
    ${DonationAccountValue}=    Get Text    xpath=.//*[@id='opp4_ileinner']
    Log    ${DonationAccountValue}
    Select Frame    id=066f4000001HGzX
    ${Table}=    Get Value    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']
    Log To Console    ${Table}
    ${ContactRoleHeader}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]
    Log    ${ContactRoleHeader}
    ${Row Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr
    ${rc_int}=    Convert To Integer    ${Row Count}
    ${Column_Count}=    Get Matching Xpath Count    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9']/thead/tr[2]/th
    ${cc_int}=    Convert To Integer    ${Column_Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    ${ContactRoleValue}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[2]
    \    Log    ${ContactRoleValue}
    \    Run Keyword If    "${ContactRoleValue}"=="${DonorValue}"    Should Be Equal    ${ContactRoleValue}    ${DonorValue}
    \    ${ContactRoleAccount}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[3]
    \    Run Keyword If    "${ContactRoleAccount}"=="${DonationAccountValue}"    Should Be Equal    ${ContactRoleAccount}    ${DonationAccountValue}
    \    ${Role}=    Get Text    xpath=.//*[@id='thePage:theForm:thePageBlock:j_id9:tb']/tr[${i}]/td[5]
    \    Run Keyword If    "${DonorValue}"=="${ContactRoleValue}"    Should Be Equal    ${Role}    ${DonorContactRole}
    \    Run Keyword If    "${Role}"!="${DonorContactRole}"    Validating_SoftCredit_Role_From_ContactVF_Page
    \    Continue For Loop If    ${i}<<${rc_int}+1


Donation_Creation_From_Contact
    Wait Until Element Is Visible    ${Contact_Tab_E}
    Click Element    ${Contact_Tab_E}
    Sleep    10s
    Click Element   xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a
    Wait Until Element Is Visible    name=edit
    Contact_Relationship_Viewer1
    Sleep   20s
    Scroll_To_Page  0   5500
    #Focus  xpath=.//*[@id='0031b00000RyUIX_RelatedOpportunityList']/div[1]/div
    #Scroll_Page
    #Go To  xpath=.//*[@id='0031b00000RyUIX_RelatedOpportunityList']/div[1]/div
    Sleep   20s
    Wait Until Element Is Visible  xpath=.//*[@id='0031b00000RyUIX_RelatedOpportunityList']/div[1]/div
    Click Element  xpath=.//*[@id='0031b00000RyUIX_RelatedOpportunityList']/div[1]/div/div[1]/table/tbody/tr/td[2]/input[1]
    Wait Until Element Is Visible  ${Amount_E}
    Input Text    ${Amount_E}    5000
    Input Text    ${SourceCode_E}    10000878
    Click Element    ${Continue_E}

