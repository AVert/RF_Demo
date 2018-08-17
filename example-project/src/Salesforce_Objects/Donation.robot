*** Settings ***
Documentation    Suite description
Documentation    Suite description
Library     Selenium2Library
#Library     ../CustomLibrary/DonationLibrary.py
Resource      ../TestCases/RegressionTestSuite.robot

*** Variables ***
${Donation_Name_E}    Id=opp3
${Donor_E}          Id=CF00Nf4000009heuH
${Stage_E}          Id=opp11
${Amount_E}         Id=opp7
${CloseDate_E}      Id=opp9
${Type_E}           Id=opp5
${SourceCode_E}     Id=00Nf4000009hevN
${Opportunity_Tab_E}    xpath=.//*[@id='Opportunity_Tab']/a
${Continue_E}     xpath=.//*[@id='bottomButtonRow']/input[1]
${New_Button_E}     name=new

#Field Verification Webelements

${Donation_Name_VE}     xpath=.//*[@id='opp3_ileinner']
${Donor_VE}     xpath=.//*[@id='CF00Nf4000009heuH_ileinner']
${Account_VE}       xpath=.//*[@id='opp4_ileinner']
${Source_Code_VE}       xpath=.//*[@id='00Nf4000009hevN_ileinner']

#Transaction record webelements
${Tracnsaction_Related_List_E}      xpath=.//*[@id='006q000000FFNJI_00Nf400000AHy7G']/div[1]/div
${Transction_Type_E}        xpath=.//*[@id='006q000000FFNJI_00Nf400000AHy7G_body']/table/tbody/tr[2]/td[3]
${Transaction_Amount}       xpath=.//*[@id='006q000000FFNJI_00Nf400000AHy7G_body']/table/tbody/tr[2]/td[5]
${Transaction_Message}      xpath=.//*[@id='006q000000FFNJI_00Nf400000AHy7G_body']/table/tbody/tr[2]/td[2]
${Transaction_ID_E}     xpath=.//*[@id='006q000000FFNJI_00Nf400000AHy7G_body']/table/tbody/tr[2]/th



*** Keywords ***
Donation Creation
    Click Element    ${Opportunity_Tab_E}
    Click Element    ${New_Button_E}
    Set Selenium Implicit Wait    20s
    Click Element    ${Continue_E}
    Input Text    ${Donation_Name_E}    ${Don_Name_V}
    Input Text    ${Amount_E}    ${Don_Amt_V}
    Input Text    ${SourceCode_E}    ${Don_Sourcecode_V}
    Input Text    ${Donor_E}    ${Don_Donor_V}
    @{Stage1}=    Get List Items    ${Stage_E}
    Select From List By Value    ${Stage_E}    @{Stage1}[4]
    @{Type1}=    Get List Items    ${Type_E}
    Select From List By Value    ${Type_E}    @{Type1}[1]
    Input Text    ${CloseDate_E}    ${Don_Date_V}
    Click Link    xpath=.//*[@id='ep']/div[2]/div[3]/table/tbody/tr[7]/td[2]/div/span/span/a
    Click Element    ${Continue/Save_E}
    #Verify the ODP Contact


