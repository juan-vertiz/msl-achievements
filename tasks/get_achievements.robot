*** Settings ***
Resource    ../resources/shared/setup_teardown.resource
Resource    ../resources/po/achievement.resource
Resource    ../resources/po/achievements.resource
Library    Browser
Library    Collections
Library    OperatingSystem
Task Setup    Setup
Task Teardown    Teardown

*** Tasks ***
Get Achievements
    ${achievements}=    Get Achievements
    ${achievements_data}=    Get Achievements Data    ${achievements}
    Write Achievements As JSON    ${achievements_data}

*** Keywords ***
Get Achievements Data
    [Arguments]    ${achievements}
    ${achievements_data}=    Create List
    FOR    ${achievement}    IN    @{achievements}
        ${title}=    Get Achievement Title    ${achievement}
        ${type}=    Get Achievement Type    ${achievement}
        ${date}=    Get Achievement Date    ${achievement}
        ${icon_url}=    Get Achievement Icon URL    ${achievement}
        ${data}=    Create Dictionary
        ...    title=${title}
        ...    type=${type}
        ...    date=${date}
        ...    icon_url=https://learn.microsoft.com${icon_url}
        Append To List    ${achievements_data}    ${data}
    END
    RETURN    ${achievements_data}

Write Achievements As JSON
    [Arguments]    ${achievements}
    ${data}=    Create Dictionary    achievements=${achievements}
    ${json}=    Evaluate    json.dumps($data, indent=4)
    Create File    ${OUTPUT_DIR}/achievements.json    ${json}