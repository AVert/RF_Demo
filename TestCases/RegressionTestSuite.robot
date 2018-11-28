*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Resource  ../Common_Configuration/Common_Configure.robot
Resource  ../Salesforce_Objects/Contact.robot
Resource  ../Salesforce_Objects/Account.robot
Resource  ../Salesforce_Objects/Church_Signup.robot
Resource  ../Salesforce_objects/MinistrySignup.robot
#Library     ../CustomLibrary/Contact.py
Library     ../CustomLibrary/ExcelUtilities.py
Variables   ../TestCases/TestSuiteVariables.robot
#Resource   ../TestCases/TestSuiteVariables.robot



*** Variables ***
${HoH_Error_Alert}    The Head of Household flag should be true for this Contact record!!!


*** Test Cases ***
TC1


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
    Contact Creation_With_Salutation
    Verifying_Greeting_Field_Value

    #Close Browser

#TC2

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
#TC3

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

#TC_4
    Ministry_Signup_form
    Log Into Salesforce
    ODP Contact Verification
    Houesehold_Contact_Field_Verification

TC_5

[Documentation]
    ${ChurchName_V}=    read_excel_data   Church_Alliance     TC5     Church Name
    set global variable  ${ChurchName_V}
    ${Church_Address_V}=    read excel data  Church_Alliance  TC5     Address
    set global variable  ${Church_Address_V}
    ${Church_Address2_v}=    read_excel_data   Church_Alliance     TC5     Address 2
    set global variable  ${church_address2_v}
    ${Church_City_V}=    read_excel_data   Church_Alliance     TC5     City
    set global variable  ${Church_City_V}
    ${Church_State_V}=    read_excel_data   Church_Alliance     TC5     State
    set global variable  ${Church_State_V}
    ${Church_Zip_V}=    read_excel_data   Church_Alliance     TC5     Zip code
    set global variable  ${Church_Zip_V}
    ${Church_Email_V}=    read_excel_data   Church_Alliance     TC5     Church Email
    set global variable  ${Church_Email_V}
    ${Church_Phone_V}=    read_excel_data   Church_Alliance     TC5     Church Phone
    set global variable   ${Church_Phone_V}
    ${Church_Denomination_V}=    read_excel_data   Church_Alliance     TC5     Denominatoin
    set global variable  ${Church_Denomination_V}
    ${HowDidYouAboutus_V}=    read_excel_data   Church_Alliance     TC5     How Did You Hear About US
    set global variable  ${HowDidYouAboutus_V}
    ${Church_Size_V}=    read excel data  Church_Alliance    TC5     Church Size
    set global variable  ${Church_Size_V}
    ${Lead_Title_V}=    read_excel_data   Church_Alliance     TC5     Lead Title
    set global variable  ${Lead_Title_V}
    ${Lead_FirstName_V}=    read_excel_data   Church_Alliance     TC5     Lead First Name
    set global variable  ${Lead_FirstName_V}
    ${Lead_LastName_V}=    read_excel_data   Church_Alliance     TC5     Lead Last Name
    set global variable  ${Lead_LastName_V}
    ${Lead_Email_V}=    read_excel_data   Church_Alliance     TC5     Lead Email
    set global variable  ${Lead_Email_V}
    ${Lead_Phone_V}=    read_excel_data   Church_Alliance     TC5     Lead Phone
    set global variable  ${Lead_Phone_V}
    ${Primary_Title_V}=    read_excel_data   Church_Alliance     TC5     Primary Title
    set global variable  ${Primary_Title_V}
    ${Primary_FirstName_V}=    read_excel_data   Church_Alliance     TC5     Primary First Name
    set global variable  ${Primary_FirstName_V}
    ${Primary_LastName_V}=    read_excel_data   Church_Alliance     TC5     Primary Last Name
    set global variable  ${Primary_LastName_V}
    ${Primary_Phone_V}=    read_excel_data   Church_Alliance     TC5     Primary Phone
    set global variable  ${Primary_Phone_V}
    ${Primary_Email_V}=    read_excel_data   Church_Alliance     TC5     Primary Email
    set global variable  ${Primary_Email_V}
    ${Attorney_FirstName_V}=    read excel data  Church_Alliance  TC5       Attorney First Name
    set global variable  ${Attorney_FirstName_V}
    ${Attorney_LastName_V}=    read excel data  Church_Alliance  TC5       Attorney Last Name
    set global variable  ${Attorney_LastName_V}
    ${Attorney_City_V}=      read excel data  Church_Alliance  TC5       Attorney City
    set global variable  ${Attorney_City_V}
    ${Attorney_State_V}=      read excel data  Church_Alliance  TC5       Attorney State
    set global variable  ${Attorney_State_V}
    ${Payer_FN_V}=    read excel data  Church_Alliance  TC5       Payer First Name
    set global variable   ${Payer_FN_V}
    ${Payer_LN_V}=    read excel data  Church_Alliance  TC5       Payer Last Name
    set global variable   ${Payer_LN_V}
    ${Payer_Address_V}=     read excel data  Church_Alliance  TC5       Payer Address
    set global variable   ${Payer_Address_V}
    ${Payer_City_V}=    read excel data  Church_Alliance  TC5       Payer City
    set global variable  ${Payer_City_V}
    ${Payer_State_V}=    read excel data  Church_Alliance  TC5       Payer State
    set global variable   ${Payer_State_V}
    ${Payer_Zipcode_v}=     read excel data  Church_Alliance    TC5     PayerZip Code
    set global variable   ${Payer_Zipcode_v}
    ${Church_CardNo_V}=     read excel data  Church_Alliance    TC5     Card No
    set global variable   ${Church_CardNo_V}
    ${Church_CardName_V}=     read excel data  Church_Alliance    TC5     Card Name
    set global variable   ${Church_CardName_V}
    ${Church_CY_V}=     read excel data  Church_Alliance    TC5     Card Year
    set global variable   ${Church_CY_V}
    ${Church_SecuirtyCode_V}=     read excel data  Church_Alliance    TC5     Security Code
    set global variable   ${Church_SecuirtyCode_V}
    #Church_Alliance_Signup_Primary
    Log Into Salesforce
    ODP Contact Verification
    Close Browser