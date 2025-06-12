*** Settings ***


Documentation    Test suite for Login Page for SauceDemo


Resource    ../PageObjects/LoginPage.robot


*** Test Cases ***


TestCase-1
    Start Automation

Test Case-2
    Login to the website with invalid credentials

TestCase-3
    Login to the website

TestCase-4
    Verify Correct Product Added to Cart

TestCase-5
    Multiple Products Added to Cart

Test Case-6
    Stop Automation

