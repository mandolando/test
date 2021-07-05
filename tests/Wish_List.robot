*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../keywords/keywords.robot
Resource          ../locators/locators.robot

*** Test Cases ***
Add to Wishlist with Login
    [Setup]    Open Website
    Click on Sign In Link
    Log In User
    Women Category
    Add Blouse to Wishlist
    Confirm added to Wishlist
    [Teardown]    Close Browser

Add to Wishlist without Login
    [Setup]    Open Website
    Women Category
    Add Blouse to Wishlist
    Confirm cannot add to Wishlist
    [Teardown]    Close Browser
