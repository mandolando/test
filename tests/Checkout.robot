*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../keywords/keywords.robot
Resource          ../locators/locators.robot

*** Test Cases ***
Pay by Check
    [Setup]    Open Website
    Click on Sign In Link
    Log In User
    Women Category
    Add to Cart    ${printetDressesLink}
    Complete Order    ${payByCheck}    ${checkPaymentURL}
    [Teardown]    Close Browser

Pay by Bank Wire
    [Setup]    Open Website
    Click on Sign In Link
    Log In User
    Women Category
    Add to Cart    ${printetDressesLink}
    Complete Order    ${checkByBankWire}    ${bankWirePaymentURL}
    [Teardown]    Close Browser

Empty shopping Cart
    [Setup]    Open Website
    Confirm empty Shopping Cart
    [Teardown]    Close Browser
