*** Settings ***
Documentation    Suite description
Library     Selenium2Library
#Library     ../CustomLibrary/AccountLibrary.py
Resource  ../TestCases/RegressionTestSuite.robot


*** Variables ***
#${Account_Name}    Id=acc
${MinstryName_E}    xpath=//input[@name="join:signupfrm:cname"]
${Minsrt_Address_E}    xpath=//input[@name="join:signupfrm:caddress1"]
${Ministry_Street_E}    Id=acc17street
${Ministry_City_E}    xpath=//input[@name="join:signupfrm:ccity"]
${Ministry_State_E}    xpath=//select[@name="join:signupfrm:cstate"]
${Ministry_Zip_E}    xpath=//input[@name="join:signupfrm:czip"]
${Ministry_PCFirstName_E}    xpath=.//input[@name="join:signupfrm:lfname"]
${Ministry_PCLastName_E}       xpath=//input[@name="join:signupfrm:llname"]
${Ministry_Title_E}     xpath=//input[@name="join:signupfrm:ltitle"]
${Ministry_PCEmail_E}   xpath=//input[@name="join:signupfrm:lemail"]
${Ministry_Phone_E}    xpath=//input[@name="join:signupfrm:cphone"]
${Ministry_PCPhone_E}   xpath=//input[@name="join:signupfrm:lphone"]
${Ministry_Email_E}     xpath=//input[@name="join:signupfrm:cemail"]
${Attorny_Min_FirstName_E}      xpath=//input[@name="join:signupfrm:afname"]
${Attorny_Min_LastName_E}       xpath=//input[@name="join:signupfrm:alname"]
${Attorny_Min_City}     xpath=//input[@name="join:signupfrm:acity"]
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
${Ministry_CardNo_E}        xapth=.//*[@id='join:signupfrm:cardnumber']
${Ministry_CardName_E}      xpath=.//*[@id='join:signupfrm:nameoncard']
${Ministry_MY_E}        xpath=.//*[@id='ccfields']/div[3]/div/div[1]/input
${Ministry_SecuirtyCode_E}      xpath=.//*[@id='join:signupfrm:securitycode']
${Payer_City_E}     xpath=.//*[@id='join:signupfrm:paycity']
${Payer_State_E}        xpath=.//*[@id='join:signupfrm:paystate']
${Payer_Zipcode_E}      xpath=.//*[@id='join:signupfrm:payzip']
${Payer_Name_E}     xpath=.//*[@id='join:signupfrm:payfname']
${Payer_LastName_E}     xpath=.//*[@id='join:signupfrm:paylname']
${Payer_Address_E}      xpath=.//*[@id='join:signupfrm:payaddress1']
${JoinNow_button_E}     xpath=.//*[@id='join:signupfrm:auth']
${Test}  xpath=.//*[@id='bottomButtonRow']/input[1]
${Signup_button_E}      xpath=.//*[@id='join:signupfrm']/div[1]/div/div/input


*** Keywords ***
Ministry_Signup_form
    Open Browser    https://qarel-adflegalv2.cs21.force.com/payment/MC_Memberjoin_VF    chrome
    Select From List By Value    //select[@id="join:signupfrm:tax-exempt"]    Yes
    Select From List By Value    //select[@id="join:signupfrm:religiousorg"]    Yes
    Click Element   ${Signup_button_E}
    wait until element is visible  ${MinstryName_E}
    Input Text  ${MinstryName_E}       ByronEvans_Ministry
    Input Text      ${Minsrt_Address_E}        71 Pilgrim Avenue
    Input Text    xpath=//input[@name="join:signupfrm:caddress2"]   Test
    Input Text    ${Ministry_City_E}    Chevy
    Select From List By Value     ${ministry_state_e}   Iowa
    Input Text      ${Ministry_Zip_E}        87876-8769
    Input Text   ${Ministry_Phone_E}     (990) 973-2907
    Input Text      ${Ministry_Email_E}        testqa81@yopmail.com
    Select From List By Value    xpath=//select[@name="join:signupfrm:hearaboutus"]    Ministry Alliance Member
    Select From List By Value    xpath=//select[@name="join:signupfrm:amrevenue"]    $3-5M
    Input Text      ${Ministry_Title_E}       Senior_Director
    Input Text      ${Ministry_PCFirstName_E}        TestMST
    Input Text      ${Ministry_PCLastName_E}        QA
    Input Text      ${Ministry_PCEmail_E}        testqa95@yopmail.com
    Input Text      ${Ministry_PCPhone_E}        (782) 384-6983
    Select From List By Value    xpath=//select[@name="join:signupfrm:attorneycontact"]    Yes
    Input Text      ${Attorny_Min_FirstName_E}      TestAttornity
    Input Text      ${Attorny_Min_LastName_E}       TestLastName
    Input Text      ${Attorny_Min_City}     TestAttornyCity
    Click Element  ${Ministry_Next_Button_E}
    #Select From List By Value    //select[@name="join:signupfrm:astate"]
    Sleep  10s
    Wait Until Element Is Visible  ${Statement_Faith_E}
    Click Element       ${Statement_Faith_E}
    Sleep  10s
    Wait Until Element Is Visible  ${Scope_Faith_E}
    Click Element   ${Scope_Faith_E}
    sleep  5s
    Wait Until Element Is Visible  xpath=//input[@name="join:signupfrm:promocode"]
    Click Element    xpath=.//*[@id='join:signupfrm:plansubmit']
    #Select From List By Value    xpath=//select[@name="join:signupfrm:paymenttypelist"]    Online
    #Input Text    xpath=//input[@name="join:signupfrm:promocode"]     MFPC
    #Click Element    xpath=//input[@name="join:signupfrm:applypromocode"]
    #Click Element    xpath=//input[@name="join:signupfrm:plansubmit"]
    #Click Element    xpath=//input[@name="join:signupfrm:upgradesubmit"]
    wait until element is visible  xpath=//input[@name="join:signupfrm:payfname"]
    Input Text    xpath=//input[@name="join:signupfrm:payfname"]    Test First
    Input Text    xpath=//input[@name="join:signupfrm:paylname"]    Last Name
    Input Text    xpath=//input[@name="join:signupfrm:payaddress1"]    Address Line 1
    Input Text    xpath=//input[@name="join:signupfrm:payaddress2"]    Address Line 2
    Input Text    xpath=//input[@name="join:signupfrm:paycity"]    Test city
    Select From List By Value    //select[@name="join:signupfrm:paystate"]    Alabama
    Input Text    xpath=//input[@name="join:signupfrm:payzip"]    67566
    Input Text      xpath=.//*[@id='join:signupfrm:cardnumber']     4111111111111111
    Input Text    xpath=.//*[@id='join:signupfrm:nameoncard']    Visa
    #Input Text    xpath=//input[@name="join:signupfrm:ammountpaid"]    2000.00
    #Input Text    ${ministry_cardno_e}    4111 1111 1111 1111
    #Input Text    xpath=//input[@name="join:signupfrm:nameoncard"]    TestVisa
    Input Text    xpath=.//*[@id='ccfields']/div[3]/div/div[1]/input    12 / 23
    #Select From List By Value    xpath=//select[@name="join:signupfrm:expmonth"]    12
    #Select From List By Value    xpath=//select[@name="join:signupfrm:expyear"]    23
    Input Text    xpath=.//*[@id='join:signupfrm:securitycode']    898
    sleep  10s
    Click Element    xpath=.//*[@id='join:signupfrm:auth']
    Capture Page Screenshot
    Wait Until Element Is Visible  xpath=.//*[@id='join:signupfrm']/div[5]/fieldset/legend








