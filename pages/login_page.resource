*** Settings ***
Documentation       Example login page object
...                 Demonstrates form handling and common login page patterns

Library             SeleniumLibrary


*** Variables ***
${LOGIN_URL}            https://practicetestautomation.com/practice-test-login/
${USERNAME_FIELD}       id=username
${PASSWORD_FIELD}       id=password
${LOGIN_BUTTON}         id=submit
${SUCCESS_MESSAGE}      css=.post-title
${ERROR_MESSAGE}        id=error
${LOGOUT_BUTTON}        xpath=//a[contains(text(), 'Log out')]


*** Keywords ***
Open Login Page
    [Documentation]    Opens the practice login page
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${USERNAME_FIELD}    timeout=10s

Enter Username
    [Documentation]    Enters username in the username field
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Enter Password
    [Documentation]    Enters password in the password field
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    [Documentation]    Clicks the login submit button
    Click Button    ${LOGIN_BUTTON}

Verify Successful Login
    [Documentation]    Verifies that login was successful
    Wait Until Page Contains Element    ${SUCCESS_MESSAGE}    timeout=10s
    Element Should Contain    ${SUCCESS_MESSAGE}    Logged In Successfully

Verify Login Error
    [Documentation]    Verifies that login error message is displayed
    [Arguments]    ${expected_error}
    Wait Until Page Contains Element    ${ERROR_MESSAGE}    timeout=5s
    Element Should Contain    ${ERROR_MESSAGE}    ${expected_error}

Perform Login
    [Documentation]    Complete login operation
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button

Click Logout Button
    [Documentation]    Clicks the logout button
    Click Element    ${LOGOUT_BUTTON}

Close Login Page
    [Documentation]    Closes the browser
    Close Browser
