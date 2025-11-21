*** Settings ***
Documentation     Example test suite demonstrating Robot Framework basics
Library           Collections
Library           String

*** Variables ***
${GREETING}       Hello, Robot Framework!
@{FRUITS}         Apple    Banana    Orange
&{USER}           name=John Doe    age=30    email=john@example.com

*** Test Cases ***
Simple Arithmetic Test
    [Documentation]    Basic calculation test
    [Tags]    arithmetic    basic
    ${result}=    Evaluate    5 + 3
    Should Be Equal As Numbers    ${result}    8
    Log    The result is: ${result}

String Manipulation Test
    [Documentation]    Test string operations
    [Tags]    string    basic
    ${upper}=    Convert To Upper Case    ${GREETING}
    Should Be Equal    ${upper}    HELLO, ROBOT FRAMEWORK!
    ${length}=    Get Length    ${GREETING}
    Should Be True    ${length} > 10

List Operations Test
    [Documentation]    Test list operations
    [Tags]    collections    list
    ${fruit_count}=    Get Length    ${FRUITS}
    Should Be Equal As Numbers    ${fruit_count}    3
    List Should Contain Value    ${FRUITS}    Banana
    ${first_fruit}=    Get From List    ${FRUITS}    0
    Should Be Equal    ${first_fruit}    Apple

Dictionary Operations Test
    [Documentation]    Test dictionary operations
    [Tags]    collections    dict
    Dictionary Should Contain Key    ${USER}    name
    ${user_name}=    Get From Dictionary    ${USER}    name
    Should Be Equal    ${user_name}    John Doe
    ${keys}=    Get Dictionary Keys    ${USER}
    ${key_count}=    Get Length    ${keys}
    Should Be Equal As Numbers    ${key_count}    3

*** Keywords ***
Custom Greeting
    [Arguments]    ${name}
    [Documentation]    Custom keyword that creates a personalized greeting
    ${greeting}=    Set Variable    Hello, ${name}!
    Log    ${greeting}
    RETURN    ${greeting}
