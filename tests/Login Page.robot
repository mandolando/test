*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../locators/locators.robot
Resource          ../keywords/keywords.robot

*** Test Cases ***
Valid Email and valid Password
    [Setup]    Open Website
    Click on Sign In Link
    Log In User
    [Teardown]    Close Browser

Valid Email and invalid Password
    [Setup]    Open Website
    Click on Sign In Link
    Log In User with invalid Credentials    123
    Confirm invalid Credentials Error    Invalid password.
    [Teardown]    Close Browser

Invalid Email and valid Password
    [Setup]    Open Website
    Click on Sign In Link
    Log In User with invalid Credentials    test@gmal.com
    Confirm invalid Credentials Error    Authentication failed.
    [Teardown]    Close Browser
