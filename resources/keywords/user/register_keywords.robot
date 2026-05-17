*** Settings ***
Resource   ../base_resource.robot

*** Keywords ***
    
Create Default User Payload
    ${email}=    FakerLibrary.Email
    ${password}=    Set Variable     Senha@123
    ${name}=    FakerLibrary.FirstName

    ${body}=    Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    password=${password}
    
    RETURN    ${body}

Given that the user registration endpoint is available
    Create Session    api    ${BASE_URL}    disable_warnings=1

## Name field
I send a POST request to the registration endpoint with the "name" field empty
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    name=${EMPTY}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a post request to the registration endpoint with name fewer than 3 characters
    ${name}=    Set Variable    aa
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    name=${name}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a post request to the registration endpoint with name more than 100 characters
    ${name}=    Evaluate    "a" * 101
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    name=${name}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

## Email field
I send a POST request to the registration endpoint with the "email" field empty
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    email=${EMPTY}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST request to the registration endpoint with an email without the "@" symbol
    ${email}=    Set Variable    testemail.com
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    email=${email}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST request to the registration endpoint with invalid email format
    ${email}=    Set Variable    testemaill@com
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    email=${email}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST request to the registration endpoint with email more than 100 characters
    ${email}=    Evaluate    "a" * 101 + "@example.com"
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    email=${email}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

## Password field

I send a POST request to the registration endpoint with the "password" field empty
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    password=${EMPTY}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST request to the registration with password fewer than 8 characters
    ${password}=    Set Variable    Aa@123
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    password=${password}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST request to the registration with password without uppercase letters
    ${password}=    Set Variable    senha@123
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    password=${password}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST request to the registration with password without lowercase letters
    ${password}=    Set Variable    SENHA@123
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    password=${password}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST request to the registration with password without numbers
    ${password}=    Set Variable    Senha@abcdef
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    password=${password}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST request to the registration with password without special characters
    ${password}=    Set Variable    Senha12345
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    password=${password}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST request to the registration with password more than 100 characters
    ${password}=    Evaluate    "A" * 101 + "a@123"
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    password=${password}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

## Bussiness rules

register a user with random email
    ${body}=     Create Default User Payload
    Set Test Variable    ${REGISTERED_EMAIL}    ${body.email}

    Set To Dictionary    ${body}    

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST registration endpoint with an email that is already in use
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    email=${REGISTERED_EMAIL}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST registration endpoint with all inputs empty
    ${body}=     Create Default User Payload

    Set To Dictionary    ${body}    email=${EMPTY}    password=${EMPTY}    name=${EMPTY}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST registration endpoint with all inputs null
    ${body}=   Create Default User Payload

    Set To Dictionary    ${body}    email=${None}    password=${None}    name=${None}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

## Sucessful registration
register a user with exactly ${char_count} characters in the name field
    ${name}=    Evaluate    "a" * ${char_count}
    ${body}=   Create Default User Payload

    Set To Dictionary    ${body}    name=${name}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

register a user with exactly ${char_count} characters in the password field
    ${password}=    Evaluate    "a" * ${char_count}
    ${body}=   Create Default User Payload

    Set To Dictionary    ${body}    password=${password}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

register a user with exactly 100 characters in the email field
    ${email}=    Evaluate    "a" * 88 + "@example.com"
    ${body}=   Create Default User Payload

    Set To Dictionary    ${body}    email=${email}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

I send a POST request to the registration endpoint with languague
    [Arguments]    ${language}

    ${body}=   Create Default User Payload

    Set To Dictionary    ${body}    language=${language}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}

    Log To Console    ${body}

I send a POST request to the registration endpoint with role
    [Arguments]    ${role}

    ${body}=   Create Default User Payload

    Set To Dictionary    ${body}    role=${role}

    Send POST Request    ${ENDPOINT_REGISTER}    ${body}