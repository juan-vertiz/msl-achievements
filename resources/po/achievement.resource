*** Settings ***
Library    Browser

*** Keywords ***
Get Achievement Title
    [Arguments]    ${locator}
    ${title}=    Get Text    ${locator} >> //a[@class='card-content-title']
    RETURN    ${title}

Get Achievement Type
    [Arguments]    ${locator}
    ${type}=    Get Text    ${locator} >> //p[@class='card-content-super-title']
    RETURN    ${type}

Get Achievement Date
    [Arguments]    ${locator}
    ${date}=    Get Text    ${locator} >> //time
    RETURN    ${date}

Get Achievement Icon URL
    [Arguments]    ${locator}
    ${icon_url}=    Get Attribute    ${locator} >> //img   src
    RETURN    https://learn.microsoft.com${icon_url}

Get Resource URL
    [Arguments]    ${locator}
    ${resource_url}=    Get Attribute    ${locator} >> //a[@class='card-content-title']   href
    RETURN    https://learn.microsoft.com${resource_url}