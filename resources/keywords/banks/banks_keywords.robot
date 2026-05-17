*** Settings ***
Resource   ../base_resource.robot

*** Keywords ***
    
that the bank endpoint is available
    Create Session    api    ${BASE_URL}    disable_warnings=1


Create Default Bank
    ${name}=            FakerLibrary.Company
    ${code}=            FakerLibrary.Numerify    text=###
    ${shortName}=       FakerLibrary.Lexify      text=?????    letters=ABCDEFGHIJKLMNOPQRSTUVWXYZ
    ${logoUrl}=         FakerLibrary.Image Url   width=200    height=200

    ${body}=    Create Dictionary
    ...    name=${name}
    ...    code=${code}
    ...    shortName=${shortName}
    ...    logoUrl=${logoUrl}

    RETURN    ${body}

Delete Created Bank
    Log To Console    ${RESPONSE}
    Log To Console    ${CREATED_BANK_ID}    
    Send DELETE Request    ${ENDPOINT_BANK}    ${CREATED_BANK_ID}    ${TOKEN}
    Then the response status code should be "200"
    Log To Console    ${RESPONSE}

I send a POST request to the create bank endpoint with all fields
    [Arguments]    ${name}    ${code}    ${shortName}    ${logoUrl}
    ${body}=    Create Default Bank

    Set To Dictionary    ${body}    name=${name}    code=${code}    shortName=${shortName}    logoUrl=${logoUrl}

    Send POST Request    ${ENDPOINT_BANK}    ${body}    ${TOKEN}
    Log To Console    ${JSON}    
    Set Test Variable    ${CREATED_BANK_ID}    ${JSON["data"]["id"]}

I send a POST request to the create bank endpoint with required fields only
    [Arguments]    ${name}
    ${body}=    Create Default Bank

    Set To Dictionary    ${body}    name=${name}    code=${None}    shortName=${None}    logoUrl=${None}

    Send POST Request    ${ENDPOINT_BANK}    ${body}    ${TOKEN}
    Log To Console    ${JSON}    
    Set Test Variable    ${CREATED_BANK_ID}    ${JSON["data"]["id"]}
