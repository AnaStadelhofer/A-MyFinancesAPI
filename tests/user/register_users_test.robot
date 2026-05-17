*** Settings ***
Resource   ../../resources/keywords/base_resource.robot

*** Test Cases ***

## Validate inputs
    # Name field
Scenario 1: Validate the requirement for the "name" field.
    [Tags]    Register    Validation    Name    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration endpoint with the "name" field empty
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Name" field with the message "Name is required."
    And must return error messages within the "Name" field with the message "Name must be at least 3 characters."

Scenario 2: Register a name with fewer than 3 characters.
    [Tags]    Register    Validation    Name    Failure
    Given that the user registration endpoint is available
    When I send a post request to the registration endpoint with name fewer than 3 characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Name" field with the message "Name must be at least 3 characters."

Scenario 3: Register a name with more than 100 chacracters.
    [Tags]    Register    Validation    Name    Failure
    Given that the user registration endpoint is available
    When I send a post request to the registration endpoint with name more than 100 characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Name" field with the message "Name must be at most 100 characters."

    # Email field

Scenario 4: Validate the requirement for the "email" field.
    [Tags]    Register    Validation    Email    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration endpoint with the "email" field empty
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Email" field with the message "Email is required."
    And must return error messages within the "Email" field with the message "Invalid email address."
    And must return error messages within the "Email" field with the message "Email must be at least 3 characters."

Scenario 5: Register a e-mail without the "@" symbol.
    [Tags]    Register    Validation    Email    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration endpoint with an email without the "@" symbol
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Email" field with the message "Invalid email address."

Scenario 6: Register a invalid e-mail format.
    [Tags]    Register    Validation    Email    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration endpoint with invalid email format
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Email" field with the message "Invalid email address."

Scenario 7: Register a e-mail with more than 100 characters.
    [Tags]    Register    Validation    Email    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration endpoint with email more than 100 characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Email" field with the message "Email must be at most 100 characters."

    # Password field

Scenario 8: Validate the requirement for the "password" field.
    [Tags]    Register    Validation    Password    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration endpoint with the "password" field empty
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Password" field with the message "Password is required."
    And must return error messages within the "Password" field with the message "Password must be at least 8 characters."

Scenario 9: Register a password with fewer than 8 characters.
    [Tags]    Register    Validation    Password    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration with password fewer than 8 characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Password" field with the message "Password must contain at least one uppercase letter, one lowercase letter, one number and one special character (@$!%*?&_-#)."

Scenario 10: Register a password without uppercase letters.
    [Tags]    Register    Validation    Password    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration with password without uppercase letters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Password" field with the message "Password must contain at least one uppercase letter, one lowercase letter, one number and one special character (@$!%*?&_-#)."

Scenario 11: Register a password without lowercase letters.
    [Tags]    Register    Validation    Password    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration with password without lowercase letters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Password" field with the message "Password must contain at least one uppercase letter, one lowercase letter, one number and one special character (@$!%*?&_-#)."

Scenario 12: Register a password without numbers.
    [Tags]    Register    Validation    Password    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration with password without numbers
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Password" field with the message "Password must contain at least one uppercase letter, one lowercase letter, one number and one special character (@$!%*?&_-#)."

Scenario 13: Register a password without special characters.
    [Tags]    Register    Validation    Password    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration with password without special characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Password" field with the message "Password must contain at least one uppercase letter, one lowercase letter, one number and one special character (@$!%*?&_-#)."

Scenario 14: Register a password with more than 100 characters.
    [Tags]    Register    Validation    Password    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration with password more than 100 characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Password" field with the message "Password must be at most 100 characters."

## Bussiness rules

Scenario 15: Validate that the system does not allow registration with an email that is already in use.
    [Tags]    Register    Bussines_rules    Failure
    Given that the user registration endpoint is available
    When register a user with random email
    And I send a POST registration endpoint with an email that is already in use
    Then the response status code should be "409"
    And must return HasError as "true"
    And must return the default message "Email already registered."
    And data must return null
    And errors must return null

Scenario 16: Validate that all fields are required for registration.
    [Tags]    Register    Bussines_rules    Failure
    Given that the user registration endpoint is available
    When I send a POST registration endpoint with all inputs empty
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Password" field with the message "Password is required."
    And must return error messages within the "Password" field with the message "Password must be at least 8 characters."
    And must return error messages within the "Email" field with the message "Email must be at least 3 characters."
    And must return error messages within the "Email" field with the message "Invalid email address."
    And must return error messages within the "Email" field with the message "Email is required."
    And must return error messages within the "Name" field with the message "Name must be at least 3 characters."
    And must return error messages within the "Name" field with the message "Name is required."

Scenario 17: Validate that all fields are null for registration.
    [Tags]    Register    Bussines_rules    Failure
    Given that the user registration endpoint is available
    When I send a POST registration endpoint with all inputs null
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Password" field with the message "Password is required."
    And must return error messages within the "Email" field with the message "Email is required."
    And must return error messages within the "Name" field with the message "Name is required."

Scenario 18: Register a user with a invalid language
    [Tags]    Register     Bussines_rules    Language    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration endpoint with languague    'pt-br'
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Language" field with the message "Language must be 'pt-BR', 'en-US' or 'es-ES'."

Scenario 19: Register a user with a empty language
    [Tags]    Register     Bussines_rules    Language    Failure
    Given that the user registration endpoint is available
    When I send a POST request to the registration endpoint with languague    ''
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the default message "Validation failed."
    And data must return null
    And must return error messages within the "Language" field with the message "Language must be 'pt-BR', 'en-US' or 'es-ES'."

## Sucessful registration

Scenario 20: Validate that a user can be successfully registered with valid data.
    [Tags]    Register     Succesfully
    Given that the user registration endpoint is available
    When register a user with random email
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the default message "User registered successfully. Please check your email to verify your account."
    And data must return null
    And errors must return null

Scenario 21: Register a user with a name with exactly 3 characters.
    [Tags]    Register     Succesfully
    Given that the user registration endpoint is available
    When register a user with exactly 3 characters in the name field
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the default message "User registered successfully. Please check your email to verify your account."
    And data must return null
    And errors must return null

Scenario 22: Register a user with a name with exactly 100 characters.
    [Tags]    Register     Succesfully
    Given that the user registration endpoint is available
    When register a user with exactly 100 characters in the name field
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the default message "User registered successfully. Please check your email to verify your account."
    And data must return null
    And errors must return null

Scenario 23: Register a user with a password with exactly 8 characters.
    [Tags]    Register     Succesfully
    Given that the user registration endpoint is available
    When register a user with exactly 8 characters in the password field
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the default message "User registered successfully. Please check your email to verify your account."
    And data must return null
    And errors must return null

Scenario 24: Register a user with a password with exactly 100 characters.
    [Tags]    Register     Succesfully
    Given that the user registration endpoint is available
    When register a user with exactly 100 characters in the password field
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the default message "User registered successfully. Please check your email to verify your account."
    And data must return null
    And errors must return null

Scenario 25: Register a user with an email with exactly 100 characters.
    [Tags]    Register     Succesfully
    Given that the user registration endpoint is available
    When register a user with exactly 100 characters in the email field
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the default message "User registered successfully. Please check your email to verify your account."
    And data must return null
    And errors must return null

Scenario 26: Register a user with a languague pt-br
    [Tags]    Register     Succesfully
    Given that the user registration endpoint is available
    When I send a POST request to the registration endpoint with languague     pt-BR
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the default message "User registered successfully. Please check your email to verify your account."
    And data must return null
    And errors must return null    

Scenario 27: Register a user with a languague en-US
    [Tags]    Register     Succesfully
    Given that the user registration endpoint is available
    When I send a POST request to the registration endpoint with languague     en-US
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the default message "User registered successfully. Please check your email to verify your account."
    And data must return null
    And errors must return null 

Scenario 28: Register a user with a different role and consult
    [Tags]    Register     Succesfully    Security
    Given that the user registration endpoint is available
    When I send a POST request to the registration endpoint with role     2
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the default message "User registered successfully. Please check your email to verify your account."
    And data must return null
    And errors must return null
    #And consult the database to validate that the user was registered with the role 2
