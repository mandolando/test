*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../keywords/keywords.robot
Resource          ../locators/locators.robot

*** Variables ***

*** Test Cases ***
Product is listed
    [Setup]    Open Website
    Women Category
    Confirm Blouse in Tops subcategory
    [Teardown]    Close Browser

Filter Option
    [Setup]    Open Website
    Women Category
    Confirm Blouse in Tops subcategory
    Blouses Filter
    [Teardown]    Close Browser

Compare two Products
    [Setup]    Open Website
    Women Category
    Add to Compare Printed Dress Product
    Add to Compare Printed Summer Dress Product
    Comparasion Page
    [Teardown]    Close Browser

Remove Products from Comparasion Page
    [Setup]    Open Website
    Women Category
    Add to Compare Printed Dress Product
    Add to Compare Printed Summer Dress Product
    Comparasion Page
    Remove Products Comparasion
    [Teardown]    Close Browser

*** Keywords ***
