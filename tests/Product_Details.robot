*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../keywords/keywords.robot
Resource          ../locators/locators.robot

*** Test Cases ***
Product Check
    [Setup]    Open Website
    Women Category
    Product Image
    Product Verification
    [Teardown]    Close Browser

Product review without Login
    [Setup]    Open Website
    Women Category
    Product Image
    Element Should Not Be Visible    ${review}
    [Teardown]    Close Browser

Product review with Login
    [Setup]    Open Website
    Click on Sign In Link
    Log In User
    Women Category
    Product Image
    Product review
    [Teardown]    Close Browser

Check Send to a friend functionality
    [Setup]    Open Website
    Women Category
    Product Image
    Confirm Send to a Friend Functionality
    [Teardown]    Close Browser
