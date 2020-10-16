*** Settings ***
Library           SeleniumLibrary
#Suite Setup       Prepare
Suite Teardown    Close Browser
Test Teardown     Close Browser

*** Variables ***
${URL}            https://www.google.com
${CHROMEDRIVER_PATH}        /usr/local/bin/chromedriver

*** Keywords ***
Open Website
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless
    Open Browser    ${URL}    chrome    options=${chrome_options}      executable_path=${CHROMEDRIVER_PATH}

*** Test Cases ***
TC001 Browser Start and Close
    Open Website
    [Teardown]    Close Browser
#    Open Browser  ${URL}  ${Browser}
