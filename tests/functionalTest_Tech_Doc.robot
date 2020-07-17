*** Settings ***
Library           Selenium2Library
Documentation     https://www.freecodecamp.org/learn/responsive-web-design/responsive-web-design-projects/build-a-technical-documentation-page

*** Variables ***
${TECH PAGE}   C:/Users/R Co/WebSite/Technical_Doc/Tech_Doc.html
${BROWSER}     Chrome

*** Test Cases ***
Check open Technical Documentation
  When Technical Documentation Page is opened
  Then The expected title page should be 'Technical Documentation Page'
  [Teardown]  Close Browser

Check link switch to another section
  When Technical Documentation Page is opened
  Given Link on page is clicked
  Then Should be right section
  [Teardown]  Close Browser

*** Keywords ***
Technical Documentation Page is opened
    Open Browser                        ${TECH PAGE}    ${BROWSER}

The expected title page should be '${title}'
    Title should be                     ${title}

Link on page is clicked
    Click link                          css=li:nth-child(1) > .nav-link

Should be right section
    Page should contain element         id=Introduction
    Page should contain                 JavaScript and Java are similar in some ways but fundamentally different in some others
