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
    [Documentation]    Get Microsoft Learn Achievements as JSON data
    ...
    ...    This tasks gets achievements from Microsoft Learn and writes them to
    ...    a JSON file called `achievements.json` in the output directory.
    ...    
    ...    Variables:
    ...    - USER: The user's Microsoft Learn username as shown in the URL of their profile page.
    ...    - TYPE: The type of achievements to get. Can be 'trophies', 'modules', 'course' and 'other'. If not given, all types are returned.
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
        ${resource_url}=    Get Resource URL    ${achievement}
        ${data}=    Create Dictionary
        ...    title=${title}
        ...    type=${type}
        ...    date=${date}
        ...    icon_url=${icon_url}
        ...    resource_url=${resource_url}
        Append To List    ${achievements_data}    ${data}
    END
    RETURN    ${achievements_data}

Write Achievements As JSON
    [Arguments]    ${achievements}
    ${json}=    Evaluate    json.dumps($achievements, indent=4)
    Create File    ${OUTPUT_DIR}/achievements.json    ${json}