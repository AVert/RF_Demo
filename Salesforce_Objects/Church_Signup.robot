*** Settings ***
Documentation    Suite description
Library     Selenium2Library
#Library     ../CustomLibrary/AccountLibrary.py
Resource   ../TestCases/TestSuiteVariables.robot


*** Variables ***

# Church Information

${Church_Signup_URL}    https://qarel-adflegalv2.cs25.force.com/payment/CA_MembershipJoin_VF
${ChurchName_E}    xpath=.//*[@id='join:signupfrm:cname']
${Church_Address_E}    xpath=.//*[@id='join:signupfrm:caddress1']
${Church_Address2_E}    xpath=.//*[@id='join:signupfrm:caddress2']
${Church_City_E}    xpath=.//*[@id='join:signupfrm:ccity']
${Church_State_E}    xpath=.//*[@id='join:signupfrm:cstate']
${Church_Zip_E}    xpath=//input[@name="join:signupfrm:czip"]
${Church_Phone_E}       xpath=.//*[@id='join:signupfrm:cphone']
${Church_Email_E}       xpath=.//*[@id='join:signupfrm:cemail']
${Church_Denomination_E}   xpath=.//*[@id='join:signupfrm:cdenom']
${Church_Size_E}        xpath=.//*[@id='join:signupfrm:csize']
${HowDidYouAboutus}     xpath=.//*[@id='join:signupfrm:cdenomref']

# Secondary Contact Information

${Lead_FirstName_E}    xpath=.//*[@id='join:signupfrm:lfname']
${Lead_LastName_E}       xpath=.//*[@id='join:signupfrm:llname']
${Lead_Title_E}     xpath=.//*[@id='join:signupfrm:ltitle']
${Lead_Email_E}   xpath=.//*[@id='join:signupfrm:lemail']
${Lead_Phone_E}    xpath=.//*[@id='join:signupfrm:lphone']

# Primary Contact Information

${Primary_Contact_Checkbox}     xpath=.//*[@id='join:signupfrm:lprimarycontact']
${Primary_FirstName_E}    xpath=.//*[@id='join:signupfrm:pfname']
${Primary_LastName_E}       xpath=.//*[@id='join:signupfrm:plname']
${Primary_Title_E}     xpath=.//*[@id='join:signupfrm:ptitle']
${Primary_Email_E}   xpath=.//*[@id='join:signupfrm:pemail']
${Church_Primary_Phone_E}    xpath=.//*[@id='join:signupfrm:pphone']

# Attoney Information Webelements

${Attorney_Contact}      xpath=.//*[@id='join:signupfrm:attorneycontact']
${Attorney_FirstName_E}      xpath=.//*[@id='join:signupfrm:afname']
${Attorney_LastName_E}       xpath=.//*[@id='join:signupfrm:alname']
${Attorney_City}     xpath=.//*[@id='join:signupfrm:acity']
${Attorney_State_E}      xpath=.//*[@id='join:signupfrm:astate']
${Next_Attorney_E}      xpath=.//*[@id='join:signupfrm']/div[1]/div/div/input[1]

# Payment Details

${Church_Next_Button_E}       xpath=.//*[@id='join:signupfrm']/div[2]/div/div/input[1]
${Next}        xpath=.//*[@id='join:signupfrm']/div[2]/div/div/input[1])
${Statement_Faith_E}    xpath=.//*[@id='sof']/div/div/div[3]/button
${Scope_Faith_E}        xpath=.//*[@id='sos']/div/div/div[3]/button
${Monthly_E}        xpath=.//*[@id='payques']/div[2]/div/div/div[2]/div/div[2]/button
${Annually_E}       xpath=.//*[@id='payques']/div[2]/div/div/div[1]/div/div[2]/button
${Payment_Date_E}       xpath=.//*[@id='payques']/div[3]/div[2]/div/div/button[2]
${Church_Promocode_E}     xpath=.//*[@id='join:signupfrm:promocode']
${Promocode_Apply_Button_E}     xpath=.//*[@id='join:signupfrm:applypromocode']
${Pricing_Details_Close_E}      xpath=.//*[@id='plan-deets']/div/div/div[3]/button
${Next_Join_E}      xpath=.//*[@id='join:signupfrm:plansubmit']
${Payer_FN_E}      xpath=.//*[@id='join:signupfrm:payfname']
${Payer_LN_E}       xpath=.//*[@id='join:signupfrm:paylname']
${PaybyMail_Link_E}       xapth=.//*[@id='payment']/div[1]/div/button
${Church_PayOnline_E}      xpath=.//*[@id='paybymail']/div/div/div[3]/button[1]
${Confirm_button_E}     xpath=.//*[@id='paybymail']/div/div/div[3]/button[2]
${Payer_State_E}        xpath=.//*[@id='join:signupfrm:paystate']
${Payer_Zipcode_E}      xpath=.//*[@id='join:signupfrm:payzip']
${Payer_Address_E}      xpath=.//*[@id='join:signupfrm:payaddress1']
${Payer_Address2_E}     xpath=//input[@name="join:signupfrm:payaddress2"]

# Credit Card Information

${Church_CardNo_E}        xpath=.//*[@id='join:signupfrm:cardnumber']
${Church_CardName_E}      xpath=.//*[@id='join:signupfrm:nameoncard']
${Church_CY_E}        xpath=.//*[@id='ccfields']/div[3]/div/div[1]/input
${Church_SecuirtyCode_E}      xpath=.//*[@id='join:signupfrm:securitycode']
${Payer_City_E}     xpath=.//*[@id='join:signupfrm:paycity']
${JoinNow_button_E}     xpath=.//*[@id='join:signupfrm:auth']
${Test}  xpath=.//*[@id='bottomButtonRow']/input[1]
${Signup_button_E}      xpath=.//*[@id='join:signupfrm']/div[1]/div/div/input
${Thankyou_E}       xpath=.//*[@id='join:signupfrm']/div[5]/fieldset/legend
${Submit_button_E}      xpath=.//*[@id='join:signupfrm:auth']



*** Keywords ***
Church_Alliance_Signup_Primary
    Open Browser  ${Church_Signup_URL}  chrome
    Click Element   ${Signup_button_E}
    Maximize Browser Window
    wait until element is visible  ${ChurchName_E}
    Input Text  ${ChurchName_E}       ${ChurchName_V}
    Input Text      ${Church_Address_E}        ${Church_Address_V}
    Input Text      ${Church_Address2_E}   ${church_address2_v}
    Input Text    ${Church_City_E}    ${Church_City_V}
    Select From List By Value     ${Church_state_E}    ${Church_State_V}
    Input Text      ${Church_Zip_E}        ${Church_Zip_V}
    Input Text   ${Church_Phone_E}      ${Church_Phone_V}
    Input Text      ${Church_Email_E}        ${Church_Email_V}
    Select From List By Value    ${HowDidYouAboutus}    ${HowDidYouAboutus_V}
    Select From List By Value    ${Church_Denomination_E}    ${Church_Denomination_V}
    Select From List By Value    ${Church_Size_E}       ${Church_Size_V}
    Input Text      ${Lead_Title_E}       ${Lead_Title_V}
    Input Text      ${Lead_FirstName_E}       ${Lead_FirstName_V}
    Input Text      ${Lead_LastName_E}        ${Lead_LastName_V}
    Input Text      ${Lead_Email_E}        ${Lead_Email_V}
    Input Text      ${Lead_Phone_E}        ${Lead_Phone_V}
    Click Element  ${Primary_Contact_Checkbox}
    Input Text      ${Primary_Title_E}     ${Primary_Title_V}
    Input Text      ${Primary_FirstName_E}         ${Primary_FirstName_V}
    Input Text      ${Primary_LastName_E}        ${Primary_LastName_V}
    Input Text      ${Primary_Email_E}        ${Primary_Email_V}
    Input Text      ${Church_Primary_Phone_E}       ${Primary_Phone_V}
    Select From List By Value   ${Attorney_Contact}     Yes
    Input Text      ${Attorney_FirstName_E}      ${Attorney_FirstName_V}
    Input Text      ${Attorney_LastName_E}       ${Attorney_LastName_V}
    Input Text      ${Attorney_City}     ${Attorney_City_V}
    Select From List By Value    ${Attorney_State_E}    ${Attorney_State_V}
    Click Element  ${Next_Attorney_E}
    Sleep  10s
    Wait Until Element Is Visible  ${Statement_Faith_E}
    Click Element       ${Statement_Faith_E}
    Sleep  10s
    Wait Until Element Is Visible  ${Scope_Faith_E}
    Click Element   ${Scope_Faith_E}
    Wait Until Element Is Visible  ${Church_Promocode_E}
    sleep  20s
    Click Element  ${Monthly_E}
    #Click Element  ${Payment_Date_E}
    Wait Until Element Is Visible  xpath=.//*[@id='join:signupfrm:plansubmit']
    Click Element  xpath=.//*[@id='join:signupfrm:plansubmit']
    wait until element is visible  ${Payer_FN_E}
    Input Text    ${Payer_FN_E}    ${Payer_FN_V}
    Input Text    ${Payer_LN_E}    ${Payer_LN_V}
    Input Text    ${Payer_Address_E}    ${Payer_Address_V}
    Input Text    ${Payer_Address2_E}    ${Payer_Address2_V}
    Input Text    ${Payer_City_E}    ${Payer_City_V}
    Select From List By Value    ${Payer_State_E}    ${Payer_State_V}
    Input Text    ${Payer_Zipcode_E}    ${payer_zipcode_v}
    Input Text    ${Church_CardNo_E}     ${Church_CardNo_V}
    Input Text    ${Church_CardName_E}   ${Church_CardName_V}
    Input Text    ${Church_CY_E}    ${Church_CY_V}
    Input Text    ${Church_SecuirtyCode_E}    ${Church_SecuirtyCode_V}
    sleep  5s
    Click Element    ${Submit_button_E}
    Set Selenium Implicit Wait  5s
    Capture Page Screenshot
    Close Browser

Church_Alliance_Signup_Promo_Code

    Open Browser        chrome  ${Church_Signup_URL}
    Click Element   ${Signup_button_E}
    wait until element is visible  ${ChurchName_E}
    Input Text  ${ChurchName_E}       ${ChurchName_V}
    Input Text      ${Church_Address_E}        ${Church_Address_V}
    Input Text      ${Church_Address2_E}   ${church_address2_v}
    Input Text    ${Church_City_E}    ${Church_City_V}
    Select From List By Value     ${Church_state_E}    ${Church_State_V}
    Input Text      ${Church_Zip_E}        ${Church_Zip_V}
    Input Text   ${Church_Phone_E}      ${Church_Phone_V}
    Input Text      ${Church_Email_E}        ${Church_Email_V}
    Select From List By Value    ${HowDidYouAboutus}    M${HowDidYouAboutus_V}
    Select From List By Value    ${Church_Denomination_E}    ${Church_Denomination_V}
    Input Text      ${Lead_Title_E}       ${Lead_Title_V}
    Input Text      ${Lead_FirstName_E}       ${Lead_FirstName_V}
    Input Text      ${Lead_LastName_E}        ${Lead_LastName_E}
    Input Text      ${Lead_Email_E}        ${Lead_Email_V}
    Input Text      ${Lead_Phone_E}        ${Lead_Phone_V}
    Select From List By Value        Yes
    Input Text      ${Attorney_FirstName_E}      ${Attorney_FirstName_V}
    Input Text      ${Attorney_LastName_E}       ${Attorney_LastName_V}
    Input Text      ${Attorney_City}     ${Attorney_City_V}
    Select From List By Value    ${Attorney_State_E}    ${Attorney_State_V}
    Click Element  ${Next_Attorney_E}
    Sleep  10s
    Wait Until Element Is Visible  ${Statement_Faith_E}
    Click Element       ${Statement_Faith_E}
    Sleep  10s
    Wait Until Element Is Visible  ${Scope_Faith_E}
    Click Element   ${Scope_Faith_E}
    sleep  5s
    Wait Until Element Is Visible  ${Church_Promocode_E}
    Click Element  ${Monthly_E}
    Click Element  ${Payment_Date_E}
    Input Text    ${Church_Promocode_E}     ${Church_Promocode_V}
    Click Element   ${Promocode_Apply_Button_E}
    Click Element  ${Next_Join_E}
    wait until element is visible  ${Payer_FN_E}
    Input Text    ${Payer_FN_E}    ${Payer_FN_V}
    Input Text    ${Payer_LN_E}    ${Payer_LN_V}
    Input Text    ${Payer_Address_E}    ${Payer_Address_V}
    Input Text    ${Payer_Address2_E}    ${Payer_Address2_V}
    Input Text    ${Payer_City_E}    ${Payer_City_V}
    Select From List By Value    ${Payer_State_E}    ${Payer_State_V}
    Input Text    ${Payer_Zipcode_E}    ${Payer_Zipcode_V}
    Input Text    ${Church_CardNo_E}     ${Church_CardNo_V}
    Input Text    ${Church_CardName_E}   ${Church_CardName_V}
    Input Text    ${Church_CY_E}    ${Church_City_V}
    Input Text    ${Church_SecuirtyCode_E}    ${Church_SecuirtyCode_V}
    sleep  10s
    Click Element    ${Signup_button_E}
    Wait Until Element Is Visible   ${Thankyou_E}
    Capture Page Screenshot

Church_Alliance_Signup_PayByMail

    Open Browser        chrome  ${Church_Signup_URL}
    Click Element   ${Signup_button_E}
    wait until element is visible  ${ChurchName_E}
    Input Text  ${ChurchName_E}       ${ChurchName_V}
    Input Text      ${Church_Address_E}        ${Church_Address_V}
    Input Text      ${Church_Address2_E}   ${church_address2_v}
    Input Text    ${Church_City_E}    ${Church_City_V}
    Select From List By Value     ${Church_state_E}    ${Church_State_V}
    Input Text      ${Church_Zip_E}        ${Church_Zip_V}
    Input Text   ${Church_Phone_E}      ${Church_Phone_V}
    Input Text      ${Church_Email_E}        ${Church_Email_V}
    Select From List By Value    ${HowDidYouAboutus}    M${HowDidYouAboutus_V}
    Select From List By Value    ${Church_Denomination_E}    ${Church_Denomination_V}
    Input Text      ${Lead_Title_E}       ${Lead_Title_V}
    Input Text      ${Lead_FirstName_E}       ${Lead_FirstName_V}
    Input Text      ${Lead_LastName_E}        ${Lead_LastName_E}
    Input Text      ${Lead_Email_E}        ${Lead_Email_V}
    Input Text      ${Lead_Phone_E}        ${Lead_Phone_V}
    Select From List By Value        Yes
    Input Text      ${Attorney_FirstName_E}      ${Attorney_FirstName_V}
    Input Text      ${Attorney_LastName_E}       ${Attorney_LastName_V}
    Input Text      ${Attorney_City}     ${Attorney_City_V}
    Select From List By Value    ${Attorney_State_E}    ${Attorney_State_V}
    Click Element  ${Next_Attorney_E}
    Sleep  10s
    Wait Until Element Is Visible  ${Statement_Faith_E}
    Click Element       ${Statement_Faith_E}
    Sleep  10s
    Wait Until Element Is Visible  ${Scope_Faith_E}
    Click Element   ${Scope_Faith_E}
    sleep  5s
    Wait Until Element Is Visible  ${Church_Promocode_E}
    Click Element  ${Monthly_E}
    Click Element  ${Payment_Date_E}
    Input Text    ${Church_Promocode_E}     ${Church_Promocode_V}
    Click Element    ${Promocode_Apply_Button_E}
    Click Element  ${Next_Join_E}
    wait until element is visible  ${Payer_FN_E}
    Click Element  ${PaybyMail_Link_E}
    Wait Until Element Is Visible  ${Confirm_button_E}
    click element  ${Confirm_button_E}
    Wait Until Element Is Visible   ${Thankyou_E}
    Capture Page Screenshot

Church_Alliance_Signup_Leadinfo

    Open Browser        chrome  ${Church_Signup_URL}
    Click Element   ${Signup_button_E}
    wait until element is visible  ${ChurchName_E}
    Input Text  ${ChurchName_E}       ${ChurchName_V}
    Input Text      ${Church_Address_E}        ${Church_Address_V}
    Input Text      ${Church_Address2_E}   ${church_address2_v}
    Input Text    ${Church_City_E}    ${Church_City_V}
    Select From List By Value     ${Church_state_E}    ${Church_State_V}
    Input Text      ${Church_Zip_E}        ${Church_Zip_V}
    Input Text   ${Church_Phone_E}      ${Church_Phone_V}
    Input Text      ${Church_Email_E}        ${Church_Email_V}
    Select From List By Value    ${HowDidYouAboutus}    M${HowDidYouAboutus_V}
    Select From List By Value    ${Church_Denomination_E}    ${Church_Denomination_V}
    Input Text      ${Lead_Title_E}       ${Lead_Title_V}
    Input Text      ${Lead_FirstName_E}       ${Lead_FirstName_V}
    Input Text      ${Lead_LastName_E}        ${Lead_LastName_E}
    Input Text      ${Lead_Email_E}        ${Lead_Email_V}
    Input Text      ${Lead_Phone_E}        ${Lead_Phone_V}
    Select From List By Value        Yes
    Input Text      ${Attorney_FirstName_E}      ${Attorney_FirstName_V}
    Input Text      ${Attorney_LastName_E}       ${Attorney_LastName_V}
    Input Text      ${Attorney_City}     ${Attorney_City_V}
    Select From List By Value    ${Attorney_State_E}    ${Attorney_State_V}
    Click Element  ${Next_Attorney_E}
    Sleep  10s
    Wait Until Element Is Visible  ${Statement_Faith_E}
    Click Element       ${Statement_Faith_E}
    Sleep  10s
    Wait Until Element Is Visible  ${Scope_Faith_E}
    Click Element   ${Scope_Faith_E}
    sleep  5s
    Wait Until Element Is Visible  ${Church_Promocode_E}
    Click Element  ${Monthly_E}
    Click Element  ${Payment_Date_E}
    Click Element  ${Next_Join_E}
    wait until element is visible  ${Payer_FN_E}
    Input Text    ${Payer_FN_E}    ${Payer_FN_V}
    Input Text    ${Payer_LN_E}    ${Payer_LN_V}
    Input Text    ${Payer_Address_E}    ${Payer_Address_V}
    Input Text    ${Payer_Address2_E}    ${Payer_Address2_V}
    Input Text    ${Payer_City_E}    ${Payer_City_V}
    Select From List By Value    ${Payer_State_E}    ${Payer_State_V}
    Input Text    ${Payer_Zipcode_E}    ${Payer_Zipcode_V}
    Input Text    ${Church_CardNo_E}     ${Church_CardNo_V}
    Input Text    ${Church_CardName_E}   ${Church_CardName_V}
    Input Text    ${Church_CY_E}    ${Church_City_V}
    Input Text    ${Church_SecuirtyCode_E}    ${Church_SecuirtyCode_V}
    sleep  10s
    Click Element    ${Signup_button_E}
    Wait Until Element Is Visible  ${Thankyou_E}
    Capture Page Screenshot
