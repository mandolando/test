*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../keywords/keywords.robot
Resource          ../locators/locators.robot

*** Variables ***

*** Test Cases ***
Search existing Product
    [Setup]    Open Website
    Existing Product
    [Teardown]    Close Browser

Search non-existing Product
    [Setup]    Open Website
    Non-existing Product
    [Teardown]    Close Browser
