*** Settings ***
Documentation     Common reusable keywords for test automation

*** Keywords ***
Log Environment Info
    [Documentation]    Logs current environment information
    Log    Current OS: ${CURDIR}
    Log    Test Suite: ${SUITE_NAME}
    Log    Test Name: ${TEST_NAME}

Calculate Sum
    [Arguments]    ${num1}    ${num2}
    [Documentation]    Calculates the sum of two numbers
    ${result}=    Evaluate    ${num1} + ${num2}
    RETURN    ${result}

Verify Text Contains
    [Arguments]    ${text}    ${substring}
    [Documentation]    Verifies that text contains a substring
    Should Contain    ${text}    ${substring}
    Log    Verified: "${text}" contains "${substring}"
