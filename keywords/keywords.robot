*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../locators/locators.robot

*** Keywords ***
Open Website
    Open Browser    ${URL}    ${browser}

Click on Sign In Link
    Click Element    ${signInLink}
    Wait Until Page Contains    ${authenticationText}

Log In User
    Input Text    ${emailField}    ${username}
    Input Password    ${passwordField}    ${password}
    Click Element    ${logInButton}
    Wait Until Location Contains    ${myAccountUrl}
    Title Should Be    ${myAccountTitle}

Product Verification
    Element Should Contain    ${priceElement}    $27.00
    Element Attribute Value Should Be    ${quantityElement}    value    1
    Element Should Be Visible    ${sizeElement}
    Element Should Be Visible    ${colorElement}

Add to Cart
    [Arguments]    ${itemLink}
    Click Element    ${itemLink}
    Wait Until Element Is Visible    ${addToCartButton}
    Click Element    ${addToCartButton}
    Wait Until Element Is Visible    ${proceedToCheckout}

Complete Order
    [Arguments]    ${payBy}    ${paymentSummary}
    Click Element    ${proceedToCheckout}
    Wait Until Location Contains    ${shoppingCartSummary}
    Click Element    ${Checkout2}    #Proceed To Checkout
    Wait Until Location Contains    ${addresses}
    Click Element    ${Checkout3}    #Proceed To Checkout
    Wait Until Location Contains    ${shipping}
    Select Checkbox    ${termsOfService}
    Click Element    ${Checkout4}    #Proceed To Checkout
    Wait Until Location Contains    ${paymentMethod}
    Click Element    ${payBy}
    Wait Until Location Contains    ${paymentSummary}
    Click Element    ${confirmOrder}
    Page Should Contain    Your order on My Store is complete.

Fill Registration
    Wait Until Element Is Visible    ${genderRadio}
    Select Radio Button    ${genderRadio}    2
    Input Text    ${firstNameInput}    Robot
    Input Text    ${lastNameInput}    Robovski
    Input Password    ${registerPassword}    112233
    Input Text    ${addressInput}    Wolfstr.
    Input Text    ${cityInput}    Denver
    Select From List By Index    ${stateInput}    6
    Input Text    ${postcodeInput}    00000
    Select From List By Label    ${countryInput}    United States
    Input Text    ${mobilePhoneInput}    1234567890
    Input Text    ${addressAlias}    My address
    Click Button    ${registerButton}

Existing Product
    Input Text    ${dressText}    dress
    Click Element    ${searchButton}
    Wait Until Element Is Visible    ${summerDresses}

Product Image
    Click Element    ${blouseProductLink}
    Wait Until Element Contains    ${addToCartButton}    Add to cart
    Element Should Be Visible    ${imageElement}

Product review
    Element Should Be Visible    ${review}
    Click Element    ${review}
    Wait Until Element Is Visible    ${reviewTitle}
    Click Element    ${reviewTitle}
    Input Text    ${reviewTitle}    review
    Input Text    ${commentText}    Excelent Blouse
    Click Button    ${sendButton}

Blouses Filter
    Select Checkbox    ${categoriesFilter}
    Wait Until Page Does Not Contain    Faded Short Sleeve T-shirts
    Select Checkbox    ${sizeFilter}
    Wait Until Page Contains    Blouse
    Select Checkbox    ${colorFilter}

Confirm Blouse in Tops subcategory
    Click Element    ${subcategoriesLink}
    Wait Until Element Is Visible    ${blouseProductLink}
    Click Element    ${blouseProductLink}
    Wait Until Element Is Visible    ${addToCartButton}

Add Blouse to Wishlist
    Mouse Over    ${blouseProductLink}
    Click Element    ${addToWishlist}

Confirm added to Wishlist
    Wait Until Element Is Visible    ${addedToWishlist}
    Wait Until Element Contains    ${addedToWishlist}    Added to your wishlist.

Proceed to Checkout
    Click Element    ${proceedToCheckout}
    Wait Until Location Contains    ${shoppingCartSummary}
    Wait Until Element Is Visible    ${summaryTableRow}

Confirm empty Shopping Cart Notification
    Input Text    ${quantityInput}    0
    Wait Until Page Contains    Your shopping cart is empty.
    Wait Until Element Is Visible    ${emptyShoppingCart}

Create an Account
    [Arguments]    ${email}
    Input Text    ${emailInput}    ${email}
    Click Button    ${createAnAccountButton}

Confirm My Account
    Wait Until Element Is Visible    ${orderHistory}
    Wait Until Element Contains    ${welcomeToYourAccountText}    Welcome to your account. Here you can manage all of your personal information and orders.

Confirm existing Email Error
    [Arguments]    ${errorMessage}
    Wait Until Element Is Visible    ${emailError}
    Wait Until Element Contains    ${emailError}    ${errorMessage}

Log In User with invalid Credentials
    [Arguments]    ${invalidCredentials}
    Input Text    ${emailField}    nekoj@gmail.com
    Input Password    ${passwordField}    ${invalidCredentials}
    Click Element    ${logInButton}

Confirm empty Shopping Cart
    Click Element    ${cartLink}
    Wait Until Element Is Visible    ${emptyShoppingCart}
    Wait Until Element Contains    ${emptyShoppingCart}    Your shopping cart is empty.

Confirm Send to a Friend Functionality
    Click Element    ${sendToFriend}
    Wait Until Element Is Visible    ${nameOfFriendInput}
    Input Text    ${nameOfFriendInput}    Robot
    Input Text    ${emailOfFriendInput}    robot@gmail.com
    Click Button    ${sendEmailButton}
    Wait Until Element Is Visible    ${emailSentSuccessfully}
    Wait Until Element Contains    ${emailSentSuccessfully}    Your e-mail has been sent successfully

Women Category
    Click Element    ${womenLink}
    Wait Until Element Is Visible    ${subcategoriesLink}

Non-existing Product
    Input Text    ${non-existingText}    apple
    Click Element    ${searchButton}
    Wait Until Element Is Visible    ${noResults}
    Wait Until Element Contains    ${noResults}    No results were found for your search "apple"

Confirm cannot add to Wishlist
    Wait Until Element Is Visible    ${addedToWishlist}
    Wait Until Element Contains    ${addedToWishlist}    You must be logged in to manage your wishlist.

Comparasion Page
    Wait Until Element Is Visible    ${compareButton}
    Mouse Over    ${compareButton}
    Click Element    ${compareButton}
    Wait Until Element Contains    ${productComparasionTitle}    Product Comparison

Add to Compare Printed Summer Dress Product
    Mouse Over    ${printedSummerDressesLink}
    Click Element    ${addToCompareLink}
    Sleep    3s

Add to Compare Printed Dress Product
    Mouse Over    ${printetDressesLink}
    Click Element    ${addToCompareLink}
    Sleep    1s

Remove Products Comparasion
    Click Element    ${removeProduct}
    Click Element    ${removeProduct}
    Wait Until Element Contains    ${cartLink}    (empty)

Change Personal Informations
    Click Element    //*[@id="center_column"]/div/div[1]/ul/li[4]/a
    Wait Until Element Is Visible    ${firstNameChange}
    Input Text    ${firstNameChange}    Test
    Input Text    ${lastNameChange}    Testovski
    Input Password    ${currentPasswordInput}    1234567890
    Click Button    ${saveButton}
    Wait Until Element Is Visible    ${updatedMyAccount}
    Wait Until Element Contains    ${updatedMyAccount}    Your personal information has been successfully updated.

Confirm invalid Credentials Error
    [Arguments]    ${errorMessageText}
    Wait Until Element Is Visible    ${errorMessage}
    Wait Until Element Contains    ${errorMessage}    ${errorMessageText}
