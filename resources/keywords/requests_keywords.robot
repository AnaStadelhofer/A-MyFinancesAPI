*** Settings ***
Resource    base_resource.robot

*** Keywords ***
Send POST Request
    [Arguments]    ${endpoint}    ${body}    ${token}=${None}

    ${headers}=    Run Keyword If    $token is not None
    ...    Create Dictionary    Authorization=Bearer ${token}
    ...    ELSE    Create Dictionary

    ${response}=    POST On Session
    ...    api
    ...    ${endpoint}
    ...    json=${body}
    ...    headers=${headers}
    ...    expected_status=any

    ${json}=    Set Variable    ${response.json()}

    Set Test Variable    ${RESPONSE}    ${response}
    Set Test Variable    ${JSON}    ${json}

Send DELETE Request
    [Arguments]    ${endpoint}    ${id}    ${token}=${None}

    ${headers}=    Run Keyword If    $token is not None
    ...    Create Dictionary    Authorization=Bearer ${token}
    ...    ELSE    Create Dictionary

    ${response}=    DELETE On Session
    ...    api
    ...    ${endpoint}/${id}
    ...    headers=${headers}
    ...    expected_status=any

    ${json}=    Set Variable    ${response.json()}

    Set Test Variable    ${RESPONSE}    ${response}
    Set Test Variable    ${JSON}    ${json}

Send GET Request
    [Arguments]    ${endpoint}    ${token}=${None}

    ${headers}=    Run Keyword If    $token is not None
    ...    Create Dictionary    Authorization=Bearer ${token}
    ...    ELSE    Create Dictionary

    ${response}=    GET On Session
    ...    api
    ...    ${endpoint}
    ...    headers=${headers}
    ...    expected_status=any

    ${json}=    Set Variable    ${response.json()}

    Set Test Variable    ${RESPONSE}    ${response}
    Set Test Variable    ${JSON}    ${json}

Send PUT Request
    [Arguments]    ${endpoint}    ${id}    ${body}    ${token}=${None}

    ${headers}=    Run Keyword If    $token is not None
    ...    Create Dictionary    Authorization=Bearer ${token}
    ...    ELSE    Create Dictionary

    ${response}=    PUT On Session
    ...    api
    ...    ${endpoint}/${id}
    ...    json=${body}
    ...    headers=${headers}
    ...    expected_status=any

    ${json}=    Set Variable    ${response.json()}

    Set Test Variable    ${RESPONSE}    ${response}
    Set Test Variable    ${JSON}    ${json}

Send PATCH Request
    [Arguments]    ${endpoint}    ${id}    ${body}    ${token}=${None}

    ${headers}=    Run Keyword If    $token is not None
    ...    Create Dictionary    Authorization=Bearer ${token}
    ...    ELSE    Create Dictionary

    ${response}=    PATCH On Session
    ...    api
    ...    ${endpoint}/${id}
    ...    json=${body}
    ...    headers=${headers}
    ...    expected_status=any

    ${json}=    Set Variable    ${response.json()}

    Set Test Variable    ${RESPONSE}    ${response}
    Set Test Variable    ${JSON}    ${json}

I am authenticated in the system
    [Arguments]    ${email}    ${password}

    ${body}=    Create Dictionary    email=${email}    password=${password}

    Send POST Request    ${ENDPOINT_LOGIN}    ${body}

    ${token}=    Set Variable    ${JSON["data"]["token"]}

    Set Test Variable    ${TOKEN}    ${token}
