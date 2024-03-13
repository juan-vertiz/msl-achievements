*** Settings ***
Library    Browser

*** Keywords ***
Get Achievements
    [Arguments]
    ${type}=    Get Type Variable
    IF    $type is None
        ${achievements}=    Get Elements    //section[contains(@id, '-section')]//li/div[contains(@class, 'card')]
    ELSE
        ${achievements}=    Get Elements    //section[contains(@id, '${type}-section')]//li/div[contains(@class, 'card')]
    END
    RETURN    ${achievements}

Get Type Variable
    ${TYPE}=    Get Variable Value    $TYPE
    IF    $TYPE not in ['trophies', 'modules', 'course', 'other', ${None}]
        Fail    Invalid type variable
    END
    RETURN    ${TYPE}