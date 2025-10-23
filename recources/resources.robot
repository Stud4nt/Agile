*** Settings ***
Library    SeleniumLibrary
Library    ../recources/testDatas.py
Variables    ../recources/locators.py

*** Keywords ***
Generate Random Credentials
    ${email}=    Generate Random Email
    ${password}=    Generate Random Password

    Set Suite Variable    ${RANDOM_EMAIL}    ${email}
    Set Suite Variable    ${RANDOM_PASSWORD}    ${password}

Open Browser To Automation Test Store
    Open Browser    https://automationteststore.com/    chrome
    Maximize Browser Window

Fill Registration Form
    Click Element    ${LOGIN_OR_REGISTER_BTN}
    Click Button     ${CONTINUE_BTN}
    Input Text    ${FIRSTNAME_INPUT}    John
    Input Text    ${LASTNAME_INPUT}    Doe
    Input Text    ${EMAIL_INPUT}    ${RANDOM_EMAIL}
    Input Text    ${ADDRESS_INPUT}    Main Street 123
    Input Text    ${CITY_INPUT}    New York
    Select From List By Label    ${COUNTRY_SELECT}    United States
    Wait Until Element Is Visible    ${REGION_SELECT}    5s
    Select From List By Label    ${REGION_SELECT}    Guam
    Input Text    ${ZIP_INPUT}    10001
    Input Text    ${LOGIN_NAME_INPUT}    ${RANDOM_EMAIL}
    Input Text    ${PASSWORD_INPUT}    ${RANDOM_PASSWORD}
    Input Text    ${CONFIRM_INPUT}    ${RANDOM_PASSWORD}
    Click Element    ${PRIVACY_CHECKBOX}
    Click Element    ${CONTINUE_SUBMIT}
    Wait Until Page Contains    Your Account Has Been Created!    10s
