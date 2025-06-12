*** Settings ***


Documentation    Test suite for Login Page for SauceDemo


Resource    ../PageObjects/LoginPage.robot


*** Test Cases ***


TestCase-1
    Start Automation

TestCase-2
    Login to the website

TestCase-3
    Verify Correct Product Added to Cart

TestCase-4
    Multiple Products Added to Cart

Test Case-5
    Login to the website with invalid credentials

Test Case-6
    Stop Automation

