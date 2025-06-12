
*** Settings ***

Library    SeleniumLibrary
Resource    ../Resources/Variables.robot

Library    SeleniumLibrary
Resource    ../Resources/Variables.robot

*** Keywords ***

Start Automation
    [Documentation]    Start Automation
    [Tags]    start,loginpage
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    10s
    Capture Page Screenshot    ../Screenshots/start_page.png

Login to the website with invalid credentials
        #Performs Log in with invalid credentials
        [Documentation]   Login to the website
        [Tags]    start,login
        Input Text    xpath=//input[@placeholder="Username"]    ${INVALID_USERNAME}
        Input Text    xpath=//input[@placeholder="Password"]    ${INVALID_PASSWORD}
        Click Button    id=login-button
        Page Should Contain    Epic sadface: Username and password do not match any user in this service
        Capture Page Screenshot    ../Screenshots/failed_login.png
        Log    Login Failed with invalid credentials
    
Login to the website
        #Performs Log in
        [Documentation]   Login to the website
        [Tags]    start,login
        Input Text    xpath=//input[@placeholder="Username"]    ${USERNAME}
        Input Text    xpath=//input[@placeholder="Password"]    ${PASSWORD}
        Click Button    id=login-button
        Page Should Contain    Products
        Capture Page Screenshot    ../Screenshots/successful_login.png
        Log    Successfully logged in
        
Verify Correct Product Added to Cart
        [Documentation]   Add Product to Cart
        [Tags]    add product,cart
        Click Element    id=add-to-cart-sauce-labs-backpack
        Click Element    xpath=//a[@class="shopping_cart_link"]
        Page Should Contain Element    xpath=//div[contains(text(),"Sauce Labs Backpack")]
        Log    Product added to cart successfully
        Go Back

Multiple Products Added to Cart
        [Documentation]   Add Multiple Products to Cart
        [Tags]    add multiple products,cart
        Click Element    id=add-to-cart-sauce-labs-bolt-t-shirt
        Click Element    id=add-to-cart-sauce-labs-onesie
        Click Element    id=add-to-cart-sauce-labs-fleece-jacket
        Click Element    xpath=//a[@class="shopping_cart_link"]
        Click Element    xpath=//button[@id="checkout"]
        Input Text    id=first-name    ${FIRST_NAME}
        Input Text    id=last-name   ${LAST_NAME}
        Input Text    id=postal-code    ${POSTAL_CODE}
        Click Element    id=continue
        Page Should Contain   Sauce Labs Backpack
        Page Should Contain   Sauce Labs Bolt T-Shirt
        Page Should Contain   Sauce Labs Onesie
        Page Should Contain   Sauce Labs Fleece Jacket
        Log     Products are correctly listed in the checkout summary

Stop Automation
     [Documentation]    Stop Automation
     [Tags]    Stop,logout
     Click Element    xpath=//button[contains(text(),"Open Menu")]
     Click Element    xpath=//a[contains(text(),"Logout")]
     Log     Successfully Logged out
     Close All Browsers