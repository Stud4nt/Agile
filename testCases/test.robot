*** Settings ***
Documentation    Sign Up Test on Automation Test Store
Library    SeleniumLibrary
Resource    ../recources/resources.robot

Suite Setup    Open Browser To Automation Test Store
Suite Teardown    Close Browser

*** Test Cases ***
Sign Up Test
    [Documentation]    Verify that a new user can register successfully
    Generate Random Credentials
    Fill Registration Form
