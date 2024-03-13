*** Settings ***
Library    Browser

*** Keywords ***
Get Achievement Title
    [Arguments]    ${locator}
    ${achievement_title}=    Get Text    ${locator} >> //a[@class='card-content-title']
    RETURN    ${achievement_title}

Get Achievement Type
    [Arguments]    ${locator}
    ${achievement_type}=    Get Text    ${locator} >> //p[@class='card-content-super-title']
    RETURN    ${achievement_type}

Get Achievement Date
    [Arguments]    ${locator}
    ${achievement_date}=    Get Text    ${locator} >> //time
    RETURN    ${achievement_date}

Get Achievement Icon URL
    [Arguments]    ${locator}
    ${achievement_icon_url}=    Get Attribute    ${locator} >> //img   src
    RETURN    ${achievement_icon_url}

Get Resource URL
    [Arguments]    ${locator}
    ${resource_url}=    Get Attribute    ${locator} >> //a[@class='card-content-title']   href
    RETURN    https://learn.microsoft.com${resource_url}