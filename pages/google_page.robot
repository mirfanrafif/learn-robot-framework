*** Settings ***
Documentation     Google Search Page Object
...               Contains locators and keywords specific to Google search page
Library           SeleniumLibrary

*** Variables ***
${GOOGLE_URL}              https://www.google.com
${SEARCH_INPUT}            name=q
${SEARCH_BUTTON}           name=btnK
${ACCEPT_COOKIES_BUTTON}   xpath=//button[contains(., 'Accept') or contains(., 'I agree')]

*** Keywords ***
Open Google Search Page
    [Documentation]    Opens Google search page in browser
    Open Browser    ${GOOGLE_URL}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${SEARCH_INPUT}    timeout=10s

Accept Cookies If Present
    [Documentation]    Accepts cookies if the popup appears
    ${present}=    Run Keyword And Return Status    
    ...    Wait Until Page Contains Element    ${ACCEPT_COOKIES_BUTTON}    timeout=3s
    Run Keyword If    ${present}    Click Element    ${ACCEPT_COOKIES_BUTTON}

Verify Google Page Title
    [Documentation]    Verifies the page title is "Google"
    Title Should Be    Google

Enter Search Term
    [Arguments]    ${search_term}
    [Documentation]    Enters search term in the search box
    Input Text    ${SEARCH_INPUT}    ${search_term}

Submit Search
    [Documentation]    Submits the search by pressing Enter
    Press Keys    ${SEARCH_INPUT}    ENTER

Wait For Search Results
    [Arguments]    ${search_term}
    [Documentation]    Waits for search results to appear
    Wait Until Page Contains    ${search_term}    timeout=10s

Perform Search
    [Arguments]    ${search_term}
    [Documentation]    Complete search operation: enter term and submit
    Enter Search Term    ${search_term}
    Submit Search
    Wait For Search Results    ${search_term}

Close Search Page
    [Documentation]    Closes the browser
    Close Browser
