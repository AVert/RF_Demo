*** Settings ***
Documentation    Suite description
#Library  Selenium2Library
Resource  ../Common_Configuration/Common_Configure.robot
Resource  ../Salesforce_Objects/Contact.robot
Resource  ../Salesforce_Objects/Account.robot
Resource  ../Salesforce_Objects/Signup.robot
#Library     ../CustomLibrary/Contact.py
Library     ../CustomLibrary/ExcelUtilities.py
#Variables   ../TestCases/TestSuiteVariables.robot
#Resource   ../TestCases/TestSuiteVariables.robot
#Library  AllureReportLibrary         C:\\Users\\Mstemp120\\Downloads\\Salesforce_Automation-Demo\\TestCases\\Allure
#Test Setup  Login With Username And Password(1)
#Test Teardown  Close Browser


*** Variables ***
${HoH_Error_Alert}    The Head of Household flag should be true for this Contact record!!!


*** Test Cases ***
TC1
    [Setup]  Login With Username And Password(1)
    [Teardown]  close browser
    [Documentation]  *Functionality*
    ...    To verify whether the household account record is created or not when creating a household contact
    ...    *Steps*
    ...    1. Open the new instance sandbox "test.salesforce.com"
    ...    2. Enter the username and password
    ...    3. Click login button
    ...    4. Click new button and then choose the recortype
    ...    5. Click continue button
    ...    6. Enter the firstname, last name and other details
    ...    7. Click save buttom
    ...    8. Verif the expected result
    ...    *Expected Result*
    ...    Household account record should be created with name of contact name and the household name should append to the contact name
    [Tags]  Demo5
    #Login With Username And Password(1)
    ${FirstName_V1}=    read_excel_data  Contact     TC1    FirstName
    Set Global Variable   ${FirstName_V1}
    ${LastName_V1}=    read_excel_data  Contact      TC1    LastName
    Set Global Variable     ${LastName_V1}
    ${SpouseName_V1}=  read_excel_data  Contact     TC1     SpouseName
    Set Global Variable  ${SpouseName_V1}
    ${Mail_Street_V}=  read_excel_data  Contact     TC1     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     TC1     MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     TC1     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     TC1     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     TC1    MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     TC1     Email
    set global variable  ${Contact_Email_V}
    #Close Browser

TC3
    [Setup]  Login With Username And Password(1)
    [Teardown]  close browser
    [Documentation]   *Functionality*
    ...    To verify whether the household account record is created or not when creating a household contact
    ...    *Steps*
    ...    1. Open the new instance sandbox "test.salesforce.com"
    ...    2. Enter the username and password
    ...    3. Click login button
    ...    4. Click new button and then choose the recortype
    ...    5. Click continue button
    ...    6. Enter the firstname, last name and other details
    ...    7. Click save buttom
    ...    8. Verif the expected result
    ...    *Expected Result*
    ...    Household account record should be created with name of contact name and the household name should append to the contact name
    [Tags]  DemoTest
    #Login With Username And Password(1)
    ${FirstName_V}=    read_excel_data  Contact     TC3     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      TC2    LastName
    Set Global Variable     ${LastName_V}
    ${SpouseName_V}=  read_excel_data  Contact     TC3    SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     TC3     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     TC3    MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     TC3     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     TC3     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     TC3     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     TC3     Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     TC3     BirthDate
    set global variable  ${Birth_Date_V}
    Contact.Contact Creation
    #Close Browser
TC5
    [Setup]  Login With Username And Password(1)
    [Teardown]  close browser
    [Documentation]  *Functionality*
    ...    To verify whether the organization donor proxy contact record is created or not when creating a organization account
    ...    *Steps*
    ...    1. Open the new instance sandbox "test.salesforce.com"
    ...    2. Enter the username and password
    ...    3. Click login button and then navigates to account object
    ...    4. Click new button and then choose the recortype
    ...    5. Click continue button
    ...    6. Enter the account name and other details
    ...    7. Click save buttom
    ...    8. Verif the expected result
    ...    *Expected Result*
    ...    Organization donor proxy contact record should be created with name of the Account name
    [Tags]  Demo
    #Login With Username And Password(1)p
    ${Acc_Name_V}=    read_excel_data   Account     TC5     AccountName
    set global variable  ${Acc_Name_V}
    ${Bill_St_V}=     read_excel_data   Account     TC5     BillingStreet
    set global variable  ${Bill_St_V}
    ${Bill_City_V}=   read_excel_data   Account     TC5     BillingCity
    set global variable  ${Bill_City_V}
    ${Bill_Code_V}=   read_excel_data   Account          TC5     BillingZipCode
    set global variable  ${Bill_Code_V}
    ${Bill_State_V}=      read_excel_data   Account     TC5      BillingState
    set global variable  ${Bill_State_V}
    ${Bill_Country_V}=    read_excel_data   Account      TC5     BillingCountry
    set global variable  ${Bill_Country_V}
    #Close Browser

TC_6
    [Setup]
    [Teardown]  close browser
    [Documentation]  *Functionality*
    ...    To verify whether the organization donor proxy contact record is created or not when creating a organization account
    ...    *Steps*
    ...    1. Open the new instance sandbox "test.salesforce.com"
    ...    2. Enter the username and password
    ...    3. Click login button and then navigates to account object
    ...    4. Click new button and then choose the recortype
    ...    5. Click continue button
    ...    6. Enter the account name and other details
    ...    7. Click save buttom
    ...    8. Verif the expected result
    ...    *Expected Result*
    ...    Organization donor proxy contact record should be created with name of the Account name
    Ministry_Signup_form
    Login With Username And Password(1)
    #Contact Field Verification



