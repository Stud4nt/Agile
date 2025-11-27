*** Settings ***
Library    SeleniumLibrary
Library    ../recources/testDatas.py
Variables    ../recources/locators.py

*** Keywords ***
Generate Random Credentials
    ${login}=    Generate Random Login
    ${email}=    Generate Random Email
    ${password}=    Generate Random Password

    Set Suite Variable    ${RANDOM_EMAIL}    ${email}
    Set Suite Variable    ${RANDOM_PASSWORD}    ${password}
    Set Suite Variable    ${RANDOM_LOGIN}    ${login}
Open Browser To Automation Test Store
    Open Browser    https://automationteststore.com/    chrome
    Maximize Browser Window

Fill Registration Form
    Click Element    ${LOGIN_OR_REGISTER_BTN}
    Wait Until Element Is Visible    ${CONTINUE_BTN}    10s
    Scroll Element Into View    ${CONTINUE_BTN}
    Sleep    1s
    Execute JavaScript    arguments[0].click();    ${CONTINUE_BTN}
    Input Text    ${FIRSTNAME_INPUT}    John
    Input Text    ${LASTNAME_INPUT}    Doe
    Input Text    ${EMAIL_INPUT}    ${RANDOM_EMAIL}
    Input Text    ${LOGIN_NAME_INPUT}    ${RANDOM_LOGIN}
    Input Text    ${ADDRESS_INPUT}    Main Street 123
    Input Text    ${CITY_INPUT}    New York
    Select From List By Label    ${COUNTRY_SELECT}    United States
    Wait Until Element Is Visible    ${REGION_SELECT}    5s
    Sleep    1s
    Select From List By Index    ${REGION_SELECT}    2
    Input Text    ${ZIP_INPUT}    10001
    Input Text    ${LOGIN_NAME_INPUT}    ${RANDOM_LOGIN}
    Input Text    ${PASSWORD_INPUT}    ${RANDOM_PASSWORD}
    Input Text    ${CONFIRM_INPUT}    ${RANDOM_PASSWORD}
    Click Element    ${PRIVACY_CHECKBOX}
    Click Element    ${CONTINUE_SUBMIT}
    Wait Until Page Contains    Your Account Has Been Created!    10s

Open New Browser And Log In
    [Documentation]    Opens a new browser and logs in with the same random credentials.
    Close All Browsers
    Open Browser    https://automationteststore.com/    chrome
    Maximize Browser Window
    Click Element    ${LOGIN_OR_REGISTER_BTN}
    Wait Until Element Is Visible    ${LOGIN_EMAIL_INPUT}    10s
    Input Text    ${LOGIN_EMAIL_INPUT}    ${RANDOM_LOGIN}
    Input Text    ${LOGIN_PASSWORD_INPUT}    ${RANDOM_PASSWORD}
    Click Button    ${LOGIN_SUBMIT_BTN}
    Wait Until Page Contains    My Account    10s
Log Out User
    Click Element    ${LOGOUT_BTN}
    Wait Until Page Contains Element    ${LOGIN_OR_REGISTER_BTN}    10s
Buy Product
    [Documentation]    Add product to cart and complete checkout
    Go To    https://automationteststore.com/
    Sleep    2s
    Scroll Element Into View    ${HOME_FEATURED_PRODUCT}
    Wait Until Element Is Visible    ${HOME_FEATURED_PRODUCT}    5s
    Click Element    ${HOME_FEATURED_PRODUCT}
    Wait Until Page Contains Element    xpath=//a[contains(@class,'cart') and contains(.,'Add to Cart')]    10s
    Scroll Element Into View    xpath=//a[contains(@class,'cart') and contains(.,'Add to Cart')]
    Sleep    2s
    Execute JavaScript    document.querySelector("a.cart").click();


    Wait Until Element Is Visible    id=cart_checkout1    10s
    Execute JavaScript    document.getElementById('cart_checkout1').click();
    Sleep    2s
    Wait Until Element Is Visible    ${CONFIRM_ORDER_BTN}    5s
    Click Element    ${CONFIRM_ORDER_BTN}

    Wait Until Page Contains Element    ${ORDER_SUCCESS_MSG}    10s

