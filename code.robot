*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.flipkart.com
${BROWSER}      chrome
${SEARCH_ITEM}  iPhone 15
${OPTIONS}      add_argument("--headless"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage"); add_argument("--disable-gpu"); add_argument("--user-data-dir=/tmp/chrome-profile")

*** Test Cases ***
Flipkart Search Test
    [Documentation]    Open Flipkart, close login popup, and search for a product
    Open Browser    ${URL}    ${BROWSER}    options=${OPTIONS}
    Maximize Browser Window

    # Wait for search bar
    Wait Until Element Is Visible    //input[@placeholder='Search for Products, Brands and More']    10s

    # Enter product in search bar
    Input Text    //input[@placeholder='Search for Products, Brands and More']    ${SEARCH_ITEM}
    Press Keys    //input[@placeholder='Search for Products, Brands and More']    ENTER

    Sleep    5s
    Page Should Contain    ${SEARCH_ITEM}

    [Teardown]    Close Browser

