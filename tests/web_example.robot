*** Settings ***
Documentation       Web automation tests using Page Object Model

Resource            ../pages/google_page.resource
Resource            ../pages/github_page.resource


*** Variables ***
${SEARCH_TERM}      Robot Framework


*** Test Cases ***
Google Search Test
    [Documentation]    Test Google search functionality using page objects
    [Tags]    web    selenium    google
    Open Google Search Page
    Verify Google Page Title
    Perform Search    ${SEARCH_TERM}
    Close Search Page

Google Search With Multiple Steps
    [Documentation]    Test Google search with step-by-step actions
    [Tags]    web    selenium    google
    Open Google Search Page
    Accept Cookies If Present
    Enter Search Term    Robot Framework Automation
    Submit Search
    Wait For Search Results    Robot Framework
    Close Search Page

GitHub Homepage Test
    [Documentation]    Test GitHub homepage elements
    [Tags]    web    selenium    github
    Open GitHub Homepage
    Verify GitHub Logo Is Visible
    Verify Page Contains Text    The future of building happens together
    Close GitHub Page

GitHub Navigation Test
    [Documentation]    Test navigation on GitHub
    [Tags]    web    selenium    github    navigation
    Open GitHub Homepage
    Click Pricing Link
    Verify Page Contains Text    Pricing
    Close GitHub Page
