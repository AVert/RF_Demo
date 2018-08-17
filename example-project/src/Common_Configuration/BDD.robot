*** Settings ***
Documentation    Suite description
Library   Selenium2Library
Resource  ../Common_Configuration/Common_Configure.robot

*** Test Cases ***
TC_4
    [Tags]    DEBUG
    Given   Browser
    When    Maximize Browser Window
    And     set selenium implicit wait  10s
    Then    Login With Username And Password(1)

*** Keywords ***
Browser
    Open Browser   https://test.salesforce.com  chrome




















Selenium Advance function
    #Login With Username And Password(1)
    Open Browser  https://login.salesforce.com   chrome
    maximize browser window
    Input Text      ${UsernameElement}      nallavansf@gmail.com
    Input Text      ${PasswordElement}      metasoft@123
    Click Element   ${Submit}
    set selenium implicit wait  20s
    Click Element   xpath=.//*[@id='report_Tab']/a
    Click Element   xpath=.//*[@id='00O7F000006F6Jc_NAME']/div[2]/a/span
    Set Selenium Implicit Wait  20s
    Sleep  10s
    Click Element   xpath = .//*[@id='report']/div[1]/div[2]/input[3]
    Sleep  10s
    Drag And Drop       xpath=.//*[@id='extdd-51']      xpath=.//*[@id='gridViewHeaderpreviewPanelGrid']
    Sleep  10s
    Click Element  xpath=.//*[@id='saveReportBtn']/tbody/tr[2]/td[2]/em
