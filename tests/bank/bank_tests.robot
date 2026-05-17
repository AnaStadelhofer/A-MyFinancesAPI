
*** Settings ***
Resource   ../../resources/keywords/base_resource.robot
Library    AppiumLibrary

*** Test Cases ***

Scenario 01: Create bank with all fields
    [Tags]    Bank    Create    Successfully
    Given that the bank endpoint is available
    And I am authenticated in the system    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    When I send a POST request to the create bank endpoint with all fields    Itaú    341    ITAÚ    https://cdn.exemplo.com/itau.png
    Then the response status code should be "201"
    And must return HasError as "false"
    And must return the default message "Bank created successfully."
    And errors must return null
    And must return data within the name field with the message Itaú
    And must return data within the code field with the message 341
    And must return data within the shortName field with the message ITAÚ
    And must return data within the logoUrl field with the message https://cdn.exemplo.com/itau.png
    And must return data within the isActive field with the message true
    Delete Created Bank

Scenario 02: Create bank without optional fields
    [Tags]    Bank    Create    Successfully
    Given that the bank endpoint is available
    And I am authenticated in the system    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    When I send a POST request to the create bank endpoint with required fields only    Bradesco
    Then the response status code should be "201"
    And must return HasError as "false"
    And must return the default message "Bank created successfully."
    And errors must return null
    And must return data within the name field with the message Bradesco
    And must return data within the code field with the message null
    And must return data within the shortName field with the message null
    And must return data within the logoUrl field with the message null
    And must return data within the isActive field with the message true
    Delete Created Bank

Scenario 03: Create bank with code shorter than 3 digits should normalize
    [Tags]    Bank    Create    Successfully
    Given that the bank endpoint is available
    And I am authenticated in the system    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    When I send a POST request to the create bank endpoint with all fields    Santander    33    SAN    https://cdn.exemplo.com/santander.png
    Then the response status code should be "201"
    And must return HasError as "false"
    And must return the default message "Bank created successfully."
    And errors must return null
    And must return data within the name field with the message Santander
    And must return data within the code field with the message 033
    And must return data within the shortName field with the message SAN
    And must return data within the logoUrl field with the message https://cdn.exemplo.com/santander.png
    And must return data within the isActive field with the message true
    Delete Created Bank
