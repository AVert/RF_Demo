*** Settings ***
Documentation    Suite description
Library     Selenium2Library
#Library     ../CustomLibrary/AccountLibrary.py
Resource   ../TestCases/TestSuiteVariables.robot


*** Variables ***

# Ministry Details

${Ministry_Signup_URL}     https://qarel-adflegalv2.cs25.force.com/payment/MC_Memberjoin_VF
${MinstryName_E}    xpath=//input[@name="join:signupfrm:cname"]
${Minsrty_Address_E}    xpath=//input[@name="join:signupfrm:caddress1"].//*[@id='join:signupfrm:amrevenue']
${Ministry_Address2}    xpath=//input[@name="join:signupfrm:caddress2"]
${Ministry_Street_E}    Id=acc17street
${Ministry_City_E}    xpath=//input[@name="join:signupfrm:ccity"]
${Ministry_State_E}    xpath=//select[@name="join:signupfrm:cstate"]
${Ministry_Zip_E}    xpath=//input[@name="join:signupfrm:czip"]
${Annual_Revenue_E}   xpath=.//*[@id='join:signupfrm:amrevenue']
${Ministry_Phone_E}    xpath=//input[@name="join:signupfrm:cphone"]
${Ministry_Email_E}     xpath=//input[@name="join:signupfrm:cemail"]
${HowDidYouAboutus}        xapth=.//*[@id='join:signupfrm:hearaboutus']

# Primary Contact Information

${Ministry_PCFirstName_E}    xpath=.//input[@name="join:signupfrm:lfname"]
${Ministry_PCLastName_E}       xpath=//input[@name="join:signupfrm:llname"]
${Ministry_Title_E}     xpath=//input[@name="join:signupfrm:ltitle"]
${Ministry_PCEmail_E}   xpath=//input[@name="join:signupfrm:lemail"]
${Ministry_PCPhone_E}   xpath=//input[@name="join:signupfrm:lphone"]

# Attorney Information

${Attorny_Contact}      xpath=.//*[@id='join:signupfrm:attorneycontact']
${Attorney_Min_FirstName_E}      xpath=//input[@name="join:signupfrm:afname"]
${Attorney_Min_LastName_E}       xpath=//input[@name="join:signupfrm:alname"]
${Attorney_Min_City_E}     xpath=//input[@name="join:signupfrm:acity"]
${Ministry_Promocode_E}     xpath=.//*[@id='join:signupfrm:promocode']
${Ministry_Next_Button_E}       xpath=.//*[@id='join:signupfrm']/div[2]/div/div/input[1]
${Next}        xpath=.//*[@id='join:signupfrm']/div[2]/div/div/input[1])
${Statement_Faith_E}    xpath=.//*[@id='sof']/div/div/div[3]/button
${Scope_Faith_E}        xpath=.//*[@id='sos']/div/div/div[3]/button
${Promocode_Apply_Button_E}     xpath=.//*[@id='join:signupfrm:applypromocode']
${Pricing_Details_Close_E}      xpath=.//*[@id='plan-deets']/div/div/div[3]/button
${Next_Join_E}      xpath=.//*[@id='join:signupfrm:plansubmit']
${Ministry_Payer_FN_E}      xpath=.//*[@id='join:signupfrm:payfname']
${Ministry_PayOnline_E}      xpath=.//*[@id='paybymail']/div/div/div[3]/button[1]
${PaybyMail_button_E}       xapth=.//*[@id='payment']/div[1]/div/button
${Confirm_button_E}     xpath=.//*[@id='paybymail']/div/div/div[3]/button[2]

# Payer information

${Payer_City_E}     xpath=.//*[@id='join:signupfrm:paycity']
${Payer_State_E}        xpath=.//*[@id='join:signupfrm:paystate']
${Payer_Zipcode_E}      xpath=.//*[@id='join:signupfrm:payzip']
${Payer_Name_E}     xpath=.//*[@id='join:signupfrm:payfname']
${Payer_LastName_E}     xpath=.//*[@id='join:signupfrm:paylname']
${Payer_Address_E}      xpath=.//*[@id='join:signupfrm:payaddress1']
${Payer_Address2_E}     xpath=//input[@name="join:signupfrm:payaddress2"]
${JoinNow_button_E}     xpath=.//*[@id='join:signupfrm:auth']
${Test}  xpath=.//*[@id='bottomButtonRow']/input[1]
${Signup_button_E}      xpath=.//*[@id='join:signupfrm']/div[1]/div/div/input

# Credit Card Information

${Credit_CardNo_E}        xapth=.//*[@id='join:signupfrm:cardnumber']
${Credit_CardName_E}      xpath=.//*[@id='join:signupfrm:nameoncard']
${Credit_CY_E}        xpath=.//*[@id='ccfields']/div[3]/div/div[1]/input
${Credit_SecuirtyCode_E}      xpath=.//*[@id='join:signupfrm:securitycode']
${JoinNow_button_E}     xpath=.//*[@id='join:signupfrm:auth']
${Test}  xpath=.//*[@id='bottomButtonRow']/input[1]
${Signup_button_E}      xpath=.//*[@id='join:signupfrm']/div[1]/div/div/input
${Thankyou_E}       xpath=.//*[@id='join:signupfrm']/div[5]/fieldset/legend



*** Keywords ***
Ministry_Signup_form
    Open Browser        chrome  ${Ministry_Signup_URL}
    Select From List By Value    //select[@id="join:signupfrm:tax-exempt"]    Yes
    Select From List By Value    //select[@id="join:signupfrm:religiousorg"]    Yes
    Click Element   ${Signup_button_E}
    wait until element is visible  ${MinstryName_E}
    Input Text  ${MinstryName_E}       ${MinistryName_V}
    Input Text      ${Minsrty_Address_E}
    Input Text      ${Ministry_Address2}    ${Ministry_Address2_V}
    Input Text    ${Ministry_City_E}    ${Ministry_City_V}
    Select From List By Value     ${Ministry_State_E}   ${Ministry_State_V}
    Input Text      ${Ministry_Zip_E}        ${Ministry_Zip_V}
    Input Text   ${Ministry_Phone_E}     ${Ministry_Phone_V}
    Input Text      ${Ministry_Email_E}        ${Ministry_Email_V}
    Select From List By Value    ${HowDidYouAboutus}    ${HowDidYouAboutus_v}
    Select From List By Value    ${Annual_Revenue_E}    ${Annual_Revenue_V}
    Input Text      ${Ministry_Title_E}       ${Ministry_Title_V}
    Input Text      ${Ministry_PCFirstName_E}        ${Ministry_PCFirstName_V}
    Input Text      ${Ministry_PCLastName_E}        ${Ministry_PCLastName_V}
    Input Text      ${Ministry_PCEmail_E}        ${Ministry_PCEmail_V}
    Input Text      ${Ministry_PCPhone_E}        ${Ministry_PCPhone_V}
    Select From List By Value    ${Attorny_Contact}       Yes
    Input Text      ${Attorney_Min_FirstName_E}     ${Attorney_FirstName_V}
    Input Text      ${Attorney_Min_LastName_E}      ${Attorney_FirstName_V}
    Input Text      ${Attorney_Min_City_E}     ${Attorney_City_V}
    Select From List By Value    //select[@name="join:signupfrm:astate"]    ${Attorney_State_V}
    Click Element  ${Ministry_Next_Button_E}
    Sleep  10s
    Wait Until Element Is Visible  ${Statement_Faith_E}
    Click Element       ${Statement_Faith_E}
    Sleep  10s
    Wait Until Element Is Visible  ${Scope_Faith_E}
    Click Element   ${Scope_Faith_E}
    sleep  5s
    Wait Until Element Is Visible  ${Ministry_Promocode_E}
    Click Element    ${Next_Join_E}
    wait until element is visible  ${Payer_Name_E}
    Input Text    ${Payer_Name_E}    ${Payer_FN_V}
    Input Text    ${Payer_LastName_E}    ${Payer_LN_V}
    Input Text    ${Payer_Address_E}   ${Payer_Address_V}
    Input Text    ${Payer_Address2_E}   ${Payer_Address2_V}
    Input Text    ${Payer_City_E}   ${Payer_City_V}
    Select From List By Value    ${Payer_State_E}    ${Payer_State_V}
    Input Text    ${Payer_Zipcode_E}    ${Payer_Zipcode_V}
    Input Text      ${Credit_CardNo_E}     ${Church_CardNo_V}
    Input Text    ${Credit_CardName_E}    ${Church_Cardname_V}
    Input Text    ${Credit_CY_E}   ${Church_CY_V}
    Input Text    ${Credit_SecuirtyCode_E}    ${Church_SecuirtyCode_V}
    sleep  10s
    Click Element   ${JoinNow_button_E}
    Wait Until Element Is Visible  ${Thankyou_E}
    Capture Page Screenshot








