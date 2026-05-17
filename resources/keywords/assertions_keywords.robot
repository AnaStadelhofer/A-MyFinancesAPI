*** Settings ***
Resource    base_resource.robot
Library    String

*** Keywords ***
Then the response status code should be "${status_code}"

    ${status}=    Convert To Integer    ${status_code}

    Should Be Equal As Integers    ${RESPONSE.status_code}    ${status}

    Log To Console    ${RESPONSE.status_code}

And must return HasError as "${value}"

    ${value_bool}=    Convert To Boolean    ${value}

    Should Be Equal    ${JSON["hasError"]}    ${value_bool}

And must return the default message "${message}"
    Should Be Equal As Strings    ${JSON["message"]}    ${message}

And data must return null
    Should Be Equal    ${JSON["data"]}    ${None}

And must return error messages within the "${field}" field with the message "${msg}"
    ${errors}=    Get From Dictionary    ${JSON["errors"]}    ${field}
    List Should Contain Value    ${errors}    ${msg}

And must return data within the ${field} field with the message ${msg}
    ${data}=    Get From Dictionary    ${JSON["data"]}    ${field}
    ${msg_lower}=    Convert To Lower Case    ${msg}
    IF    '${msg_lower}' == 'null'
        Should Be Equal    ${data}    ${None}
    ELSE IF    '${msg_lower}' == 'true' or '${msg_lower}' == 'false'

    ${bol}=    Convert To Boolean    ${msg_lower}

    Should Be Equal    ${data}    ${bol}

    ELSE
        Should Be Equal As Strings    ${data}    ${msg}
    END

    

And errors must return null
    Should Be Equal    ${JSON["errors"]}    ${None}