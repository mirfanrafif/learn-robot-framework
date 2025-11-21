*** Settings ***
Documentation       Login tests using Page Object Model

Resource            ../pages/login_page.resource


*** Test Cases ***
Successful Login Test
    [Documentation]    Test login with valid credentials
    [Tags]    web    login    positive
    Open Login Page
    Perform Login    student    Password123
    Verify Successful Login
    Click Logout Button
    Close Login Page

Invalid Username Test
    [Documentation]    Test login with invalid username
    [Tags]    web    login    negative
    Open Login Page
    Perform Login    invaliduser    Password123
    Verify Login Error    Your username is invalid!
    Close Login Page

Invalid Password Test
    [Documentation]    Test login with invalid password
    [Tags]    web    login    negative
    Open Login Page
    Perform Login    student    wrongpassword
    Verify Login Error    Your password is invalid!
    Close Login Page

Empty Credentials Test
    [Documentation]    Test login with empty username and password
    [Tags]    web    login    negative
    Open Login Page
    Click Login Button
    Verify Login Error    Your username is invalid!
    Close Login Page
