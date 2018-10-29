#!/bin/bash

echo "$(tput setaf 2) 
***************************************************************
***************************************************************
#                                                              #
#                                                              #
# Executing robotscripts...                                    #
# This may take few minutes                                    #
#                                                              #
#                                                              #
***************************************************************
***************************************************************
$(tput sgr0)"

robot --pythonpath E:/Robot_Framework/Salesforce_Automation-Demo/TestCases/RegressionTestSuite.robot

echo "$(tput setaf 2) 
***************************************************************
***************************************************************
#                                                              #
#                                                              #
# Please wait while report is being generated...               #
# Converting .xml to .html file                                #
# This may take few minutes                                    #
#                                                              #
#                                                              #
***************************************************************
***************************************************************
$(tput sgr0)"

python robotmetrics.py