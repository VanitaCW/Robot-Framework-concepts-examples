*** Settings ***
Documentation   Test Demonstration
Library     SeleniumLibrary

*** Variables ***
${URL}      https://www.t-mobile.com/
${Browser}      chrome
${search_word}     iPhone

*** Test Cases ***

Display iPhone Search Results
    Open Browser    ${URL}      ${Browser}
    Maximize Browser Window
    Click Element   css:#acceptCookie
    Scroll Element Into View    //section[@id='4b0362a073164696612ca80d6b8202e9bc82fbc569c259ab2bfaaf4b3ee7071d']
    Element Should Not Be Visible   css:#acceptCookie
    Click Element   //span[@class='d-inline show-on-sm-modal ng-star-inserted']
    Input Text      //input[@id='nav_search_input-desktop']     ${search_word}
    Press Keys      None    ENTER
    Wait Until Page Contains    Category
    Page Should Contain     Relevant to your search
    Close Browser
