*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../keywords/keywords.robot
Resource          ../locators/locators.robot

*** Variables ***

*** Test Cases ***
Change Personal details
    [Setup]    Open Website
    Click on Sign In Link
    Log In User
    Change Personal Informations
    [Teardown]    Close Browser
