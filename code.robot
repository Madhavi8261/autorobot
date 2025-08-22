*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.flipkart.com
${BROWSER}      chrome
${SEARCH_ITEM}  iPhone 15

*** Test Cases ***
Flipkart Search Test
    [Documentation]    Open Flipkart, close login popup, and search for a product
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Close the login popup if it appears
    Wait Until Element Is Visible    //input[@placeholder='Search for Products, Brands and More']    5s
    Click Button    //input[@placeholder='Search for Products, Brands and More']

    # Enter product in search bar
    Wait Until Element Is Visible    name=q    5s
    Input Text    name=q    ${SEARCH_ITEM}
    Press Keys    name=q    ENTER

    Sleep    5s
    Page Should Contain    ${SEARCH_ITEM}

    [Teardown]    Close Browser
