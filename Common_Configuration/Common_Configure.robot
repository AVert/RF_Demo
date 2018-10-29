*** Settings ***
Documentation    Suite description
Library     Selenium2Library

*** Variables ***

${UsernameElement}      Id=username
${PasswordElement}      Id=password
${Submit}       Id=Login
${URL} =  https://test.salesforce.com


*** Keywords ***
Log into Salesforce
    Open Browser  ${URL}    chrome
    Maximize Browser Window
    Input Text  ${UsernameElement}      nallavan@mstsolutions.com.qarel
    Input Text  ${PasswordElement}      metasoft@12
    click button  ${Submit}

Close Driver
    close browser

Close All Browser window
    close all browsers

