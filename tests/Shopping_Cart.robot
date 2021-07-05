*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../keywords/keywords.robot
Resource          ../locators/locators.robot

*** Test Cases ***
Add Product to Cart
    [Setup]    Open Website
    Women Category
    Add to Cart    ${printetDressesLink}
    [Teardown]    Close Browser

Clear Shopping Cart
    [Setup]    Open Website
    Women Category
    Add to Cart    ${printetDressesLink}
    Click Element    ${continueShoppingLink}
    Wait Until Element Is Visible    ${summerDressLink}
    Add to Cart    ${summerDressLink}
    Proceed to Checkout
    ${numberOfProducts}    Get Element Count    ${summaryTableRow}
    FOR    ${i}    IN RANGE    0    ${numberOfProducts}
        Click Element    ${removeItemButton}
        Sleep    2s
    END
    Confirm empty Shopping Cart Notification
    [Teardown]    Close Browser

Remove Product with quantity 0
    [Setup]    Open Website
    Women Category
    Add to Cart    ${printetDressesLink}
    Click Element    ${proceedToCheckout}
    Confirm empty Shopping Cart Notification
    [Teardown]    Close Browser
