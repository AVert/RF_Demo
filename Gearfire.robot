*** Settings ***
Library           Selenium2Library
Library           BuiltIn
*** Variables ***
${Department}     xpath=.//*[@id='sidebar_nav']/li[1]/a
${Catagory}       xpath=.//*[@id='sidebar_nav']/li[1]/ul/li[2]/a
${Product}        xpath=.//*[@id='center_column']/div[3]/div[2]/ul/li[3]/table[4]/tbody/tr/td[2]/a
${Checkout}       xpath=.//*[@id='checkout_button']
${Shipping Preference}    Id=shipping_preference
${Email}          Id=email_address
${Confirm Email}    Id=confirm_email_address
${Phone No}       Id=phone_number
${Notes}          Id=notes
${Name}           Id=cc_name
${Address}        Id=cc_address
${City}           Id=cc_city
${State}          Id=cc_state
${Zipcode}        Id=cc_zip
${Card No}        Id=cc_number
${Expire Month}    Id=cc_exp_month
${Exp Year}       Id=cc_exp_year
${Secuirty code}    Id=cc_code
${Terms&Condn}    Id=agree
${Placed order button}    xpath=.//*[@id='authorize_button']
*** Test Cases ***
REG_01
    Open the dealer
    Select Product
    Click Element    ${Checkout}
    Close Browser
REG_02
    Open the dealer
    Select Product
    Wait Until Element Is Enabled    ${Checkout}
    sleep    20s
    Click Element    ${Checkout}
    Enter the Checkout details
    Checkout the product
*** Keywords ***
Open the dealer
    Open Browser    http://testdealer3.gearfire.com/
    Maximize Browser Window
Select Product
    Click Element    ${Department}
    Wait Until Element Is Visible    ${Catagory}
    Click Element    ${Catagory}
    Set Selenium Implicit Wait    20s
    : FOR    ${INDEX}    IN RANGE    500
    \    Log    ${INDEX}
    \    Scroll To Page    500    ${INDEX}
    Wait Until Element Is Visible    ${Product}
    Click Element    ${Product}
    Set Selenium Implicit Wait    50s
Enter the Checkout details
    Wait Until Element Is Visible    ${Shipping Preference}
    sleep     10s
    Input Text    ${Email}    nallavan@mstsolutions.com
    Input Text    ${Confirm Email}    nallavan@mstsolutions.com
    Input Text    ${Phone No}    7777777777
    Input Text    ${Notes}    Sample QA Test
    @{Preference}=    Get List Items    ${Shipping Preference}
    Select From List    ${Shipping Preference}    @{Preference}[1]
    Input Text    ${Name}    Sample QA
    Input Text    ${Address}    17010 Alico Commerce Ct #202
    Input Text    ${City}    Fort Myers
    Input Text    ${Zipcode}    33967
    Input Text    ${Card No}    4111111111111111
    @{State1}=    Get List Items    ${State}
    Select From List By Value    ${State}    @{State1}[2]
    Input Text    ${Secuirty code}    786
Checkout the product
    Click Element    ${Terms&Condn}
    Click Element    ${Placed order button}
    Wait Until Element Is Visible    xpath=.//*[@id='subscriber_window']/div[1]
    Click Element    xpath=.//*[@id='subscriber_window']/div[1]
    Capture Page Screenshot
    Wait Until Element Is Visible    xpath=.//*[@id='checkout_info']/h2[1]
    : FOR    ${INDEX}    IN RANGE    1000
    \    Log    ${INDEX}
    \    Scroll To Page    1000    ${INDEX}
    Capture Page Screenshot
    Get Window Titles
    Close Browser
Scroll To Page
    [Arguments]    ${width}    ${height}
    Execute Javascript    window.scrollTo(${width} , ${height})
