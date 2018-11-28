*** Settings ***
Documentation    Suite description

*** Variables ***

${Object_Link}  https://adflegal--qarel.my.salesforce.com/a0P/o
${New_button_E}     name=new
${Designation_Name_E}   xpath=.//*[@id='Name']
${Active_Checkbox_E}    xpath=.//*[@id='00Nf4000009hesZ']
${Default_Checkbox_E}   xpath=.//*[@id='00Nf4000009hesZ']
${Save_button_E}    name=save
${Cancel_button_E}  name=cancel

# Verification Fields
${Designation_Name_Values_E}    xpath=.//*[@id='Name_ileinner']
${Active_Value_E}   xpath=.//*[@id='00Nf4000009hesZ_chkbox']
${Default_Value_E}  xpath=.//*[@id='00Nf4000009hesa_chkbox']



*** Test Cases ***

*** Keywords ***
