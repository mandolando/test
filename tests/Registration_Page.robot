*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../keywords/keywords.robot
Resource          ../locators/locators.robot

*** Variables ***

*** Test Cases ***
Registration new user
    [Setup]    Open Website
    Click on Sign In Link
    ${random_string}    Generate Random String    12
    Create an Account    ${random_string}@gmail.com
    Fill Registration
    Confirm My Account
    [Teardown]    Close Browser

Register new user with existing Email
    [Setup]    Open Website
    Click on Sign In Link
    Create an Account    marija@nekoj.com
    Confirm existing Email Error    An account using this email address has already been registered. Please enter a valid password or request a new one.
    [Teardown]    Close Browser

Register new user with invalid Email
    [Setup]    Open Website
    Click on Sign In Link
    Create an Account    nekojemail
    Confirm existing Email Error    Invalid email address.
    [Teardown]    Close Browser

*** Keywords ***
