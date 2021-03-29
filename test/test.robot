*** Settings ***
Documentation  testing infotiv car rental

Library     SeleniumLibrary

*** Variables ***
${BROWSER} = chrome

*** Test Case ***
user can create account and access all pages
    [Documentation]                 testar så att alla sidor fungerar som de ska och att man kan komma tillbaka till huvud menyn, skapar även nytt konto
    [Tags]                          test 1

    #testar så att man kan klicka på logan
    Open browser                    about:blank     ${BROWSER}
    Go to                           http://rental33.infotiv.net/
    wait until page contains        Infotiv Car Rental
    Click element                   id: logo
    wait until page contains        Infotiv Car Rental

    #trycker på continue sedan logan för att testa om den tar mig tillbaka
    click element                   id: continue
    wait until page contains        Infotiv Car Rental
    click element                   id: logo
    wait until page contains        Infotiv Car Rental

    #trycker på about och sedan på logan
    click element                   id: about
    wait until page contains        Infotiv Car Rental
    click element                   id: logo
    wait until page contains        Infotiv Car Rental

    #trycker på create user och sedan logan för att ta mig tillbaka
    click element                   id: createUser
    wait until page contains        Create user
    click element                   id: logo
    wait until page contains        Infotiv Car Rental

    #gör så att den loggar in på en existerande konto
    input text                      id: email  test6@gmail.com
    input password                  id: password  banan123
    click element                   id: login
    wait until page contains        Infotiv Car Rental




user can book car and return it
    [Documentation]                 testar så att man kan bika en bil samt avboka den
    [Tags]                          test 2

    #trycker på my page och sedan logan för att ta mig tillbaka till start sidan
    click element                   id: mypage
    wait until page contains        Mypage
    click element                   id: logo
    wait until page contains        Infotiv Car Rental

    #väljer datum för bokning av bil
    input text                      id: start  03-30
    input text                      id: end    04-12

    #skriver in all inforamtion som behövs för att hyra en bil
    click element                   id: continue
    wait until page contains        Infotiv Car Rental
    click element                   id: bookModelSpass5
    wait until page contains        Infotiv Car Rental
    input text                      id: cardNum  1111111111111111
    input text                      id: fullName  victor hedstrom
    click element                   id: month11
    click element                   id: month2022
    input text                      id: cvc  820
    click element                   id: confirm
    click element                   id: logo
    wait until page contains        Infotiv Car Rental

    #avbokar bilen som man bokar
    click element                   id: mypage
    click element                   id: unBook1
    handle alert                    accept
    click element                   id: logo
    wait until page contains        Infotiv Car Rental
    click element                   id: logout

    #skapar ett nytt konto
    click element                   id: createUser
    wait until page contains        Create user
    input text                      id: name   victor
    input text                      id: last   hedström
    input text                      id: phone  0736101013
    input text                      id: emailCreate  test6@gmail.com
    input text                      id: confirmEmail  test6@gmail.com
    input text                      id: passwordCreate  banan123
    input text                      id: confirmPassword  banan123
    click element                   id: create
    wait until page contains        Infotiv Car Rental




    Close browser
