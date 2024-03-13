*** Settings ***
Library    Browser

*** Keywords ***
Setup
    ${BROWSER}=    Get Variable Value    $BROWSER    chromium
    ${HEADLESS}=    Get Variable Value    $HEADLESS    ${True}
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    Validate User Variable
    New Page    https://learn.microsoft.com/en-us/users/${USER}/
    Wait For Load State    networkidle

Teardown
    Close Browser    ALL

Validate User Variable
    ${USER}=    Get Variable Value    $USER
    IF    $USER is None
        Fail    \${USER} variable is not set
    END