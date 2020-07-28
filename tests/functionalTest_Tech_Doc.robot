*** Settings ***
Library           Selenium2Library
Documentation     https://www.freecodecamp.org/learn/responsive-web-design/responsive-web-design-projects/build-a-technical-documentation-page

*** Variables ***
${TECH PAGE}   C:/Users/R%20Co/WebSite/Technical_Doc/Tech_Doc.html
${BROWSER}     Chrome
&{LINK}        Introduction=css\=li:nth-child(1) > .nav-link          What_you_should_already_know=css\=li:nth-child(2) > .nav-link
...            JavaScript_and_Java=css\=li:nth-child(3) > .nav-link   Hello_world=css\=li:nth-child(4) > .nav-link      Variables=css\=li:nth-child(5) > .nav-link
...            if...else_statement=css\=li:nth-child(6) > .nav-link

*** Test Cases ***
Check open Technical Documentation
  When Technical Documentation Page is opened
  Then The expected title page should be 'Technical Documentation Page'
  [Teardown]  Close Browser

Check link switch to another section
  When Technical Documentation Page is opened
  Then Navigation works
  [Teardown]  Close Browser

*** Keywords ***
Technical Documentation Page is opened
    Open Browser                        ${TECH PAGE}    ${BROWSER}

The expected title page should be '${title}'
    Title should be                     ${title}

Navigation works
    FOR    ${navlink}    IN    @{LINK.keys()}
       Click link    ${LINK}[${navlink}]
       Location Should Be                 file:///${TECH PAGE}#${navlink}
    END