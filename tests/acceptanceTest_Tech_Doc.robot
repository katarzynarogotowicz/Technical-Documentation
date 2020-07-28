*** Settings ***
Library           Selenium2Library
Documentation     https://www.freecodecamp.org/learn/responsive-web-design/responsive-web-design-projects/build-a-technical-documentation-page
Suite Setup       Open Browser       ${TECH PAGE}    ${BROWSER}
Suite Teardown    Close Browser


*** Variables ***
${TECH PAGE}   C:/Users/R Co/WebSite/Technical_Doc/Tech_Doc.html
${BROWSER}     Chrome

*** Test Cases ***
Check open page
    Open Technical Documentation

Check the required main items
    Check the main elements

Check the required section items
    Check required elements count   p      10
    Check required elements count   code   5
    Check required elements count   li     5

Check the required nav items
    Check the nav elements
    Check header elements nav

Check nav-link to another section
    Check nav-link

Check media-query
    ${position1}      Get position
    Set Window Size   800   800
    ${position2}      Get position
    Should Be True    '${position1}'!='${position2}'


*** Keywords ***

Open Technical Documentation
    Page should contain element             id=title
    Title should be                         Technical Documentation Page

Check the main elements
    Page should contain element             id=main-doc
    Check required elements count           section   5
    ${count_header} =	Get Element Count   xpath://section/header
    ${count_section} =	Get Element Count	tag:section
    Should Be Equal   ${count_header}   ${count_section}

Check required elements count
    [Arguments]   ${tag}   ${items_total}
    ${count} =	Get Element Count	tag:${tag}
    Should Be True	${count} >= ${items_total}

Check the nav elements
    Page should contain element             id=navbar

Check header elements nav
    Page should contain                     JS Documentation

Check nav-link
    ${count_a} =	Get Element Count   xpath://a[@class="nav-link"]
    ${count_main_section_elements} =	Get Element Count	xpath://*[@class="main-section"]
    Should Be Equal   ${count_a}   ${count_main_section_elements}

Get position
    ${position}    Execute Javascript       style=window.getComputedStyle?getComputedStyle(document.querySelector('#navbar'), null):document.querySelector('#navbar').currentStyle; return style.position
    [Return]       ${position}
