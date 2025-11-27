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
Log In Test
    [Documentation]    Verify that the same user can log in from a new session
    Open New Browser And Log In
Log Out Test
    [Documentation]    Verify that user can log out successfully from a new session
    Open New Browser And Log In
    Log Out User
Buy Product Test
    [Documentation]    Verify that user can log in and buy a product
    Open New Browser And Log In
    Buy Product