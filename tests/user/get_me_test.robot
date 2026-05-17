*** Settings ***
Resource   ../../resources/keywords/base_resource.robot

*** Test Cases ***

# ✅ SUCESSO
Scenario 01: Login with valid credentials
    [Tags]    Login    Succesfully
    Given that the login endpoint is available
    When I send a POST request to the login endpoint a valid credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the default message "Login successful."
    And errors must return null

# # 📋 TERMOS NÃO ACEITOS
# Scenario 02: Login with valid credentials but terms not accepted
#     [Tags]    Login    Business_Rules    Terms
#     Given that the login endpoint is available
#     When I send a POST request to the login endpoint with email "${USER_TERMS_PENDING_EMAIL}" and password "${VALID_PASSWORD}"
#     Then the response status code should be "200"
#     And must return HasError as "false"
#     And must return the message "You must accept the terms of use to continue."
#     And must return a valid token in data
#     And must return the code "TERMS_NOT_ACCEPTED" in data

# # ❌ CREDENCIAIS INVÁLIDAS
# Scenario 03: Login with invalid password
#     [Tags]    Login    Business_Rules    Failure
#     Given that the login endpoint is available
#     When I send a POST request to the login endpoint with email "${VALID_EMAIL}" and password "wrongPassword"
#     Then the response status code should be "401"
#     And must return HasError as "true"
#     And must return the default message "Invalid email or password."

# Scenario 04: Login with invalid email
#     [Tags]    Login    Business_Rules    Failure
#     Given that the login endpoint is available
#     When I send a POST request to the login endpoint with email "invalid@email.com" and password "${VALID_PASSWORD}"
#     Then the response status code should be "401"
#     And must return HasError as "true"
#     And must return the default message "Invalid email or password."

# # 📧 E-MAIL NÃO VERIFICADO
# Scenario 05: Login with unverified email
#     [Tags]    Login    Business_Rules    Failure
#     Given that the login endpoint is available
#     When I send a POST request to the login endpoint with email "${UNVERIFIED_EMAIL}" and password "${VALID_PASSWORD}"
#     Then the response status code should be "401"
#     And must return HasError as "true"
#     And must return the default message "Please verify your email before logging in."

# # 🔒 CONTA BLOQUEADA
# Scenario 06: Login with locked account
#     [Tags]    Login    Business_Rules    Lockout    Failure
#     Given that the login endpoint is available
#     When I send a POST request to the login endpoint with email "${LOCKED_EMAIL}" and password "${VALID_PASSWORD}"
#     Then the response status code should be "401"
#     And must return HasError as "true"
#     And must return the default message "Account temporarily locked. Try again later."

# # 🔒 BLOQUEIO APÓS 5 TENTATIVAS
# Scenario 07: Account locks after 5 failed login attempts
#     [Tags]    Login    Business_Rules    Lockout    Failure
#     Given that the login endpoint is available
#     When I send a POST request to the login endpoint with email "${VALID_EMAIL}" and password "wrongPassword"
#     And I send a POST request to the login endpoint with email "${VALID_EMAIL}" and password "wrongPassword"
#     And I send a POST request to the login endpoint with email "${VALID_EMAIL}" and password "wrongPassword"
#     And I send a POST request to the login endpoint with email "${VALID_EMAIL}" and password "wrongPassword"
#     And I send a POST request to the login endpoint with email "${VALID_EMAIL}" and password "wrongPassword"
#     Then the response status code should be "401"
#     And must return HasError as "true"
#     And must return the default message "Account temporarily locked. Try again later."