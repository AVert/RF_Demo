*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  Screenshot
Resource  ../Common_Configuration/Common_Configure.robot
Resource  ../Salesforce_Objects/Contact.robot
Resource  ../Salesforce_Objects/Account.robot
Resource  ../Salesforce_Objects/Donation.robot
Library     ../CustomLibrary/ExcelUtilities.py
Variables   ../TestCases/TestSuiteVariables.robot
#Resource    ../TestCases/TestSuiteVariables.robot
#Suite Setup     Log_into_Salesforce




*** Variables ***
${HoH_Error_Alert}    The Head of Household flag should be true for this Contact record!!!
${Contact_Tab}  Id=Contact_Tab
${Opportunity_Tab_E}    xpath=.//*[@id='Opportunity_Tab']/a
${DonorContactRole}    Donor
${Email}    Id=con15
${Related_Email_E}  xpath=.//*[@id='Name_ileinner']
${Related_Email_Update}     nallavan7@yopmail.com
${Related_Address_E}    xpath=.//*[@id='00Nf4000009hew6_ileinner']
${Cancel}         name=cancel


*** Test Cases ***
ADF_REL-01
    [Tags]  Demo
    [Documentation]    *Functionality*
    ...    To Verify the household contact creation
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New \ soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-01    FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-01    LastName
    Set Global Variable      ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-01    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-01     NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V1}=  read_excel_data  Contact     ADF_REL-01     SpouseName
    Set Global Variable  ${SpouseName_V1}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-01     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-01     MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-01     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-01     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-01    MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-01     Email
    set global variable  ${Contact_Email_V}
    Log_into_Salesforce
    Contact Creation With Salutation
    Set Selenium Implicit Wait  15s
    Verifying_Greeting_Field_Value
    Should Be Equal  ${Greeting_Value}  ${FirstName_V}
    Close Browser

ADF_REL-02
    [Tags]  Demo
    [Documentation]    *Functionality*
    ...    To check whether the "Greeting" field value is updated or not,  when a user creating the
    ...    household contact record with "Salutation"   field value

    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details and Enter the values in the Salutation field
    ...    8. Click save button
    ...    9. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    9.1 The "Greeting" field value should be updated as  " Mr Test 8 Aug_28"

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-02     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-02    LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-02    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-02   NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-02    SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-02     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-02    MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-02     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-02     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-02     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-02     Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-02     BirthDate
    set global variable  ${Birth_Date_V}
    Log_into_Salesforce
    Contact Creation With Salutation
    Set Selenium Implicit Wait  15s
    Verifying_Greeting_Field_Value
    Should Be Equal  ${Greeting_Value}  ${Greeting_String1}
    Close Browser


ADF_REL-03

    [Tags]  Demo
    [Documentation]    *Functionality*
    ...    To check whether the "Greeting" field value is updated or not,  when a user creating the household contact record
    ...

    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Click save button
    ...    9. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    9.1 The "Greeting" field value should be updated as "Friend"

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-03     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-03    LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-04    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-04    NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-03    SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-03     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-03    MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-03     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-03     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-03     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-03     Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-03     BirthDate
    set global variable  ${Birth_Date_V}
    Log_into_Salesforce
    Contact Creation Without Salutation
    Set Selenium Implicit Wait  15s
    Verifying_Greeting_Field_Value
    Should Be Equal  ${Greeting_Value}  Friend
    close browser

ADF_REL-04

    [Tags]  Demo
    [Documentation]    *Functionality*
    ...    To check whether the "Greeting" field value, when a user creating the household contact record with "Nickname" field value.
    ...

    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Click save button
    ...    9. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    9.1 The "Greeting" field value should be updated as "Test_QA"

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-04     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-04    LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-04    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-04    NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-04    SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-04     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-04    MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-04     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-04     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-04     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-04     Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-04     BirthDate
    set global variable  ${Birth_Date_V}
    Log_into_Salesforce
    Contact Creation Without Salutation
    Set Selenium Implicit Wait  15s
    Verifying_Greeting_Field_Value
    Should Be Equal  ${Greeting_Value}  ${NickName_V}
    Close Browser

ADF_REL-05

    [Tags]  Demo
    [Documentation]    *Functionality*
    ...    To check whether the "Phone" field value is updated or not based on the selection of "Preferred Phone" type, while creating a new contact record.
    ...

    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Enter the values in the "Home Phone" field and select "Preferred Phone Type" as Home
    ...    9. Click save button
    ...    10. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    10.1 The "Phone" field value should be populated from the Home Phone field

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-05     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-05    LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-05    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-05   NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-05    SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-05     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-05   MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-05    MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-05    MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-05    MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-05     Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-05     BirthDate
    set global variable  ${Birth_Date_V}
    ${Home_Phone_V}=    read_excel_data  Contact     ADF_REL-05    Home Phone
    set global variable  ${Home_Phone_V}
    ${Mobile_V}=   read_excel_data      Contact     ADF_REL-05     Mobile
    set global variable  ${Mobile_V}
    ${WorkPhone_V}   read excel data     Contact     ADF_REL-05     Work Phone
    set global variable  ${WorkPhone_V}
    ${WorkPhone_Extension_V}   read excel data     Contact     ADF_REL-05     Work Phone Extension
    set global variable  ${WorkPhone_Extension_V}
    Log_into_Salesforce
    Contact Creation With Home Phone
    Set Selenium Implicit Wait  15s
    Verify_Preffered_Phone_Value
    Should Be Equal  ${Primary_Phone}   ${HomePhone_V}
    Capture Page Screenshot
    Close Browser


ADF_REL-06

    [Tags]  Smoke
    [Documentation]    *Functionality*
    ...    To check whether the "Phone" field value is updated or not based on the selection of "Preferred Phone" type, while creating a new contact record.
    ...

    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Enter the values in the "Mobile" field and select "Preferred Phone Type" as Mobile
    ...    9. Click save button
    ...    10. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    10.1 The "Phone" field value should be populated from the Mobile field

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-06     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-06     LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-06     Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-06    NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-06     SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-06      MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-06   MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-06    MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-06     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-06     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-06       Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-06     BirthDate
    set global variable  ${Birth_Date_V}
    ${Home_Phone_V}=    read_excel_data  Contact     ADF_REL-06    Home Phone
    set global variable  ${Home_Phone_V}
    ${Mobile_V}=   read_excel_data  Contact     ADF_REL-06     Mobile
    set global variable  ${Mobile_V}
    ${WorkPhone_V}   read excel data     Contact     ADF_REL-06     Work Phone
    set global variable  ${WorkPhone_V}
    ${WorkPhone_Extension_V}   read excel data     Contact     ADF_REL-06     Work Phone Extension
    set global variable  ${WorkPhone_Extension_V}
    ${Preffered_Phone_V}=       read excel data     Contact     ADF_REL-06     Preffered Phone
    set global variable  ${Preffered_Phone_V}
    Log_into_Salesforce
    Contact Creation With Mobile
    Set Selenium Implicit Wait  15s
    Verify_Preffered_Phone_Value
    Should Be Equal  ${Primary_Phone}   ${Mobile_V}
    Capture Page Screenshot
    Close Browser


ADF_REL-07

    [Tags]  Smoke
    [Documentation]    *Functionality*
    ...    To check whether the "Phone" field value is updated or not based on the selection of "Preferred Phone" type, while creating a new contact record.
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Select "Preferred Phone Type" as Work
    ...    9. Click save button
    ...    10. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    10.1 The "Phone" field value should be populated from the Work and Work Exstension field

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-07     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-07     LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-07     Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-07    NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-07     SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-07      MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-07   MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-07    MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-07     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-07     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-07       Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-07     BirthDate
    set global variable  ${Birth_Date_V}
    ${Home_Phone_V}=    read_excel_data  Contact     ADF_REL-07    Home Phone
    set global variable  ${Home_Phone_V}
    ${Mobile_V}=   read_excel_data  Contact     ADF_REL-07      Mobile
    set global variable  ${Mobile_V}
    ${WorkPhone_V}=   read excel data     Contact     ADF_REL-07     Work Phone
    set global variable  ${WorkPhone_V}
    ${WorkPhone_Extension_V}=   read excel data     Contact     ADF_REL-07     Work Phone Extension
    set global variable  ${WorkPhone_Extension_V}
    ${Preffered_Phone_V}=       read excel data     Contact     ADF_REL-07     Preffered Phone
    set global variable  ${Preffered_Phone_V}
    Log_into_Salesforce
    Contact Creation With Work Phone
    Set Selenium Implicit Wait  15s
    Verify_Preffered_Phone_Value
    Should Be Equal  ${Primary_Phone}   ${WorkPhone}
    Close Browser

ADF_REL-08
    [Tags]  Smoke
    [Documentation]    *Functionality*
    ...    To Verify the Communication preffernce field in Household contact
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Click Save button
    ...    *Expected Result*
    ...
    ...    8.1 Communication prefference field should not be checked

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-08    FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-08    LastName
    Set Global Variable      ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-08    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-08     NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V1}=  read_excel_data  Contact     ADF_REL-08     SpouseName
    Set Global Variable  ${SpouseName_V1}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-08     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-08     MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-08     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-08     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-08    MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-08     Email
    set global variable  ${Contact_Email_V}
    Log_into_Salesforce
    Contact Creation With Salutation
    Set Selenium Implicit Wait  15s
    Houesehold_Contact_Communication_Field_Verification
    Close Browser

ADF_REL-09
    [Tags]  Regression
      [Documentation]    To verify whether the related address and email record is created or not, when updating the contact's mailing address and email field
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the Sandbox "https://test.salesforce.com/"
    ...    2. Enter valid username and password
    ...    3. Click "Submit" button
    ...    4. Navigates to "Contact" object
    ...    5. Select "Household" contact in recent list
    ...    6. Click "Edit" button and Updated the Mailing address fields value as similar to the existing address in the Related Address object.
    ...    7. Click "Save" button
    ...
    ...    *Expected Result*
    ...
    ...    7.1 The Related Address record should be created in Historical Address record type
    ...    7.2 Old contact address should be mapped with the newly created related address record
    ...    7.3. Following field should be updated on the Related Address record ""Bad Address, Do Not Mail,
    ...    Mail Opt Out, and Mail Opt Out Date"
    ...    7.4 Related Email record should be created
    ...    7.5 Email status, Do Not Email, Email Opt Out, and Email Opt Out Date field shoudl be updated on the related email record
    [Template]
    #TestCase
    Common_Configure.Log_into_Salesforce
    Wait Until Element Is Visible    ${Contact_Tab}
    Click Element    ${Contact_Tab}
    Wait Until Element Is Visible    ${New_Button}
    Contact.Contact_Table_Iteration
    Contact.Contact_Field_Verification
    Click Button    ${Edit_Button}
    Input Text    ${Email}  ${Related_Email_Update}
    Click Button    ${Continue/Save}
    Wait Until Element Is Visible    ${Edit_Button}
    Contact.Related Email_RelatedList_From_Contact
    Wait Until Element Is Visible    ${Related_Email_E}
    ${RE_Email}=    Get Text    ${Related_Email_E}
    Log    ${RE_Email}
    Should Be Equal    ${RE_Email}  ${Cont_PreviousEmail}
    Close Browser

ADF_REG-10
    [Tags]  Regression
    [Documentation]    To verify whether the related address and email record is created or not, when updating the contact's mailing address and email field
    ...    *Test Steps*
    ...
    ...    1. Open the Sandbox "https://test.salesforce.com/"
    ...    2. Enter valid username and password
    ...    3. Click "Submit" button
    ...    4. Navigates to "Contact" object
    ...    5. Select "Household" contact in recent list
    ...    6. Click "Edit" button and Updated the Mailing address fields value as similar to the existing address in the Related Address object.
    ...    7. Click "Save" button
    ...
    ...    *Expected Result*
    ...
    ...    7.1 The Related Address record should be created in \ Historical Address record type
    ...    7.2 Old contact address should be mapped with the newly created related address record
    ...    7.3. Following field should be updated on the Related Address record ""Bad Address, Do Not Mail,
    ...    Mail Opt Out, and Mail Opt Out Date"
    ...    7.4 Related Email record should be created
    ...    7.5 Email status, Do Not Email, Email Opt Out, and Email Opt Out Date field shoudl be updated on the related email record
    [Template]

    #TestCase
    Common_Configure.Log_into_Salesforce
    Wait Until Element Is Visible    ${Contact_Tab}
    Click Element    ${Contact_Tab}
    Wait Until Element Is Visible    ${New_Button}
    Contact.Contact_Table_Iteration
    Contact.Contact_Field_Verification
    Click Button    ${Edit_Button}
    Contact.Contact_Exsting_Address
    Click Button    ${Continue/Save}
    Wait Until Element Is Visible    ${Edit_Button}
    Contact.Related Addres_Related List_From_Contact
    Wait Until Element Is Visible   ${Related_Address_E}
    ${RA_Street}=    Get Text    ${Related_Address_E}
    Log    ${RA_Street}
    Should Be Equal    ${RA_Street}    ${RA_PreviousStreet}
    Close Browser

ADF_REL-11
    [Tags]  Smoke
    [Documentation]    *Functionality*
    ...    To verify whether the Organization Donor Proxy Contact record is created or not, when creating a Organization Account
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Account" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the account information
    ...    8. Click save button
    ...    9. Verfiy the expected result
    ...
    ...    *Expected Result*
    ...
    ...    9.1 Organization Donor Proxy Contact record shoould be created with name of Organization account

    #TestCase
    ${Acc_Name_V}=    read_excel_data   Account     ADF_REL-11    AccountName
    set global variable  ${Acc_Name_V}
    ${Bill_St_V}=     read_excel_data   Account     ADF_REL-11     BillingStreet
    set global variable  ${Bill_St_V}
    ${Bill_City_V}=   read_excel_data   Account     ADF_REL-11     BillingCity
    set global variable  ${Bill_City_V}
    ${Bill_Code_V}=   read_excel_data   Account          ADF_REL-11     BillingZipCode
    set global variable  ${Bill_Code_V}
    ${Bill_State_V}=      read_excel_data   Account     ADF_REL-11      BillingState
    set global variable  ${Bill_State_V}
    ${Bill_Country_V}=    read_excel_data   Account      ADF_REL-11     BillingCountry
    set global variable  ${Bill_Country_V}
    Common_Configure.Log_into_Salesforce
    Account.Organization_Account_Creation
    Account.ODP_Contact_Verification_From_Account

ADF_REL-12
    [Tags]  Smoke   Regression
    [Documentation]    *Functionality*
    ...    To verify whether the new contact record is created or not under the household account by clicking "New" button
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Account" object
    ...    5. Open the Household account record in account recent list
    ...    6. Navigate to account details page
    ...    7. Scroll down the Contact related list section
    ...    8. Click "New" button and then create new contact record under the account
    ...    9. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    9.1 The contact record should be created under the account record
    ...    9.2 Head of Household flag should be false
    #Testcase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-08    FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-08    LastName
    Set Global Variable      ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-08    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-08     NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V1}=  read_excel_data  Contact     ADF_REL-08     SpouseName
    Set Global Variable  ${SpouseName_V1}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-08     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-08     MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-08     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-08     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-08    MailingCountry
    set global variable  ${Mail_Country_V}
    Log_into_Salesforce
    Account_Table_Iteration
    Household_Contact_Creation_From_Account
    Contact Creation With Salutation
    Head_Of_Household_Verifcation_For_SecondContact

ADF_REL-13
    [Tags]  Smoke
    [Documentation]    *Functionality*
    ...    To verify whether the Head of Household flag is updated or not, when user creating the second record with HOH is chencked
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Account" object
    ...    5. Open the Household account record in account recent list
    ...    6. Navigate to account details page
    ...    7. Scroll down the Contact related list section
    ...    8. Click "New" button and then create new contact record under the account
    ...    9. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    9.1 The contact record should be created under the account record
    ...    9.2 Head of Household flag should be True
    ...    9.3 Exsting Contact's Head of Household flag should be updated as False
    #Testcase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-08    FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-08    LastName
    Set Global Variable      ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-08    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-08     NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V1}=  read_excel_data  Contact     ADF_REL-08     SpouseName
    Set Global Variable  ${SpouseName_V1}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-08     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-08     MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-08     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-08     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-08    MailingCountry
    set global variable  ${Mail_Country_V}
    Log_into_Salesforce
    Account_Table_Iteration
    Household_Contact_Creation_From_Account
    Contact Creation With Salutation
    Head_Of_Household_Verifcation_For_SecondContact

ADF_REL-14

    [Documentation]    *Functionality*
    ...    To verify whether the donation contact role record is created or not
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New \ soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase
    ${Don_Name_V}=   read excel data     Donation    TC4     DonationName
    Set Global Variable  ${Don_Name_V}
    ${Don_Donor_V}=  read excel data  Donation   TC4     Donor
    Set Global Variable  ${Don_Donor_V}
    ${Don_Amt_V}=    read excel data     Donation    TC4     Amount
    Set Global Variable  ${Don_Amt_V}
    ${Don_Sourcecode_V}=    read excel data  Donation   TC4     SourceCode
    Set Global Variable  ${Don_Sourcecode_V}
    Donation.Donation_Creation
    Close Browser

ADF_REG-15

    [Documentation]    *Functionality*
    ...    To verify whether the donation contact role record is created or not
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New \ soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase
    Common_Configure.Log_into_Salesforce
    Donation.Donation_Donor_Role_Verification
    Close Browser


ADF_REL-16

    [Documentation]   *Functionality*
    ...    To verify whether the Donation name is updated or not when updating the Donor

    #TestCase
    Common_Configure.Log_into_Salesforce
    Donation.Updating_the_Donor_Value
    Close Browser

ADF_REG-17
    [Documentation]    *Functionality*
    ...
    ...    To verify the Desigation VF page after creating the Donation record
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to Donation Designation VF page section
    ...    10. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    10.1 Total amount and Designated amuont should be equal
    ...    10.2 Default Designation should be checked and it is available on center of the VF page

    #TestCase
    Common_Configure.Log_into_Salesforce
    Donation.Donation_Designation_VF_verification
    Close Browser

ADF_REG-18
    [Documentation]    *Functionality*
    ...
    ...    To check whether the \ "Head Of Household " is checked or not while creating the new household contact record
    ...
    ...    *Test Steps*
    ...
    ...    1. Open Sandbox "https://test.salesforce.com/"
    ...    2. Enter valid username and password
    ...    3. Click "Submit" button
    ...    4. Navigates to "Contact" object and click "New" button
    ...    5. Select Record type as "Household Contact" and click "Continue" button
    ...    6. Enter the values in the contact edit page fields
    ...    7. Click "Save" button.
    ...
    ...
    ...    *Expected Result*
    ...
    ...    The "Head Of Household" field should be checked for the household contact
    [Setup]

    Common_Configure.Log_into_Salesforce
    Wait Until Element Is Visible    ${Contact_Tab}
    Click Element    ${Contact_Tab}
    Wait Until Element Is Visible    ${New_Button}
    Contact.Contact_Table_Iteration
    Contact.Contact_Field_Verification
    Contact.Uncheck_Head_Of_Household_Flag
    Contact.Contact_Field_Verification
    Close Browser

ADF_REG-19

    [Documentation]    *Functionality*
    ...    To verify whether the donation contact role record is created or not
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New \ soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase
    Common_Configure.Log_into_Salesforce
    Donation.Add_New_Single_Contact_Role
    Close Browser

ADF_REG-20

    [Documentation]    *Functionality*
    ...    To verify whether the donation contact role record is created or not
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New \ soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase
    Common_Configure.Log_into_Salesforce
    Donation.Add_New_Multiple_Contact_Role
    Close Browser


*** Keywords ***

