*** Settings ***
Documentation       Common reusable keywords for test automation


*** Keywords ***
Log Environment Info
    [Documentation]    Logs current environment information
    Log    Current OS: ${CURDIR}
    Log    Test Suite: ${SUITE_NAME}
    Log    Test Name: ${TEST_NAME}

Calculate Sum
    [Documentation]    Calculates the sum of two numbers
    [Arguments]    ${num1}    ${num2}
    ${result}=    Evaluate    ${num1} + ${num2}
    RETURN    ${result}

Verify Text Contains
    [Documentation]    Verifies that text contains a substring
    [Arguments]    ${text}    ${substring}
    Should Contain    ${text}    ${substring}
    Log    Verified: "${text}" contains "${substring}"
