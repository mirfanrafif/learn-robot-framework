*** Settings ***
Documentation       GitHub Page Object
...                 Contains locators and keywords for GitHub homepage

Library             SeleniumLibrary


*** Variables ***
${GITHUB_URL}       https://github.com
${SEARCH_INPUT}     name=q
${SIGNIN_LINK}      xpath=//a[contains(@href, '/login')]
${PRICING_LINK}     xpath=//a[contains(@href, '/pricing')]
${HEADER_LOGO}      css=.octicon-mark-github


*** Keywords ***
Open GitHub Homepage
    [Documentation]    Opens GitHub homepage
    Open Browser    ${GITHUB_URL}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${HEADER_LOGO}    timeout=10s

Verify GitHub Logo Is Visible
    [Documentation]    Verifies GitHub logo is displayed
    Element Should Be Visible    ${HEADER_LOGO}

Click Sign In Link
    [Documentation]    Clicks the Sign In link
    Click Element    ${SIGNIN_LINK}
    Wait Until Location Contains    /login    timeout=5s

Click Pricing Link
    [Documentation]    Clicks the Pricing link
    Click Element    ${PRICING_LINK}
    Wait Until Location Contains    /pricing    timeout=5s

Verify Page Contains Text
    [Documentation]    Verifies that page contains specific text
    [Arguments]    ${text}
    Page Should Contain    ${text}

Close GitHub Page
    [Documentation]    Closes the browser
    Close Browser
