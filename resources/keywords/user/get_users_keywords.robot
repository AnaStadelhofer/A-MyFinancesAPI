*** Settings ***
Resource   ../base_resource.robot

*** Keywords ***
Given that the login endpoint is available
    Create Session    api    ${ENDPOINT_LOGIN}    disable_warnings=1

Create Default Login Payload
    ${email}=    FakerLibrary.Email
    ${password}=    FakerLibrary.Password

    ${body}=    Create Dictionary
    ...    email=${email}
    ...    password=${password}
    
    RETURN    ${body}

When I send a POST request to the login endpoint a valid credentials
    [Arguments]    ${email}    ${password}

    ${body}=    Create Default Login Payload 

    Set To Dictionary    ${body}    email=${email}    password=${password}

    Log To Console    ${body}    

    Send POST Request    ${ENDPOINT_LOGIN}    ${body}