*** Settings ***
Resource   ../../resources/keywords/base_resource.robot

*** Test Cases ***

# ─────────────────────────────────────────────
# SUCCESS SCENARIOS — NOT EXECUTED
# ─────────────────────────────────────────────

Scenario 01: Create a planned expense not executed with all required fields.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense not executed with description, amount planned, planned date and category
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction
    And errors must return null

Scenario 02: Create a planned expense not executed with due date informed.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense not executed with a valid due date
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction with the due date
    And errors must return null

Scenario 03: Create a planned expense not executed without due date.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense not executed without informing due date
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return DueDate as null
    And errors must return null

Scenario 04: Create a planned expense not executed with payment method informed.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense not executed with a valid payment method
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction with the payment method
    And errors must return null

Scenario 05: Create a planned expense not executed without payment method.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense not executed without informing payment method
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return PaymentMethod as null
    And errors must return null

Scenario 06: Create a planned expense not executed with amount informed.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense not executed with amount greater than 0
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the amount informed
    And errors must return null

Scenario 07: Create a planned expense not executed with description of exactly 3 characters.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense not executed with description of exactly 3 characters
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction
    And errors must return null

Scenario 08: Create a planned expense not executed with description of exactly 100 characters.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense not executed with description of exactly 100 characters
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction
    And errors must return null

# ─────────────────────────────────────────────
# SUCCESS SCENARIOS — EXECUTED
# ─────────────────────────────────────────────

Scenario 09: Create a planned expense executed with all required fields.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense executed with description, amount, amount planned, transaction date and category
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction
    And errors must return null

Scenario 10: Create a planned expense executed with due date informed.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense executed with a valid due date
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction with the due date
    And errors must return null

Scenario 11: Create a planned expense executed without due date.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense executed without informing due date
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return DueDate as null
    And errors must return null

Scenario 12: Create a planned expense executed with payment method informed.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense executed with a valid payment method
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction with the payment method
    And errors must return null

Scenario 13: Create a planned expense executed without payment method.
    [Tags]    PlannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create a planned expense executed without informing payment method
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return PaymentMethod as null
    And errors must return null

# ─────────────────────────────────────────────
# FAILURE SCENARIOS — NOT EXECUTED
# ─────────────────────────────────────────────

Scenario 14: Create a planned expense not executed without planned date.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense not executed without informing planned date
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "PlannedDate" with message "Planned date is required for non-executed transactions."
    And data must return null

Scenario 15: Create a planned expense not executed without amount planned.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense not executed without informing amount planned
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "AmountPlanned" with message "Amount planned is required and must be greater than 0."
    And data must return null

Scenario 16: Create a planned expense not executed with amount planned equal to 0.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense not executed with amount planned equal to 0
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "AmountPlanned" with message "Amount planned is required and must be greater than 0."
    And data must return null

Scenario 17: Create a planned expense not executed with amount planned less than 0.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense not executed with amount planned less than 0
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "AmountPlanned" with message "Amount planned is required and must be greater than 0."
    And data must return null

Scenario 18: Create a planned expense not executed without description.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense not executed without informing description
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Description" with message "Description is required."
    And data must return null

Scenario 19: Create a planned expense not executed with description of 2 characters.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense not executed with description of 2 characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Description" with message "Description must be at least 3 characters."
    And data must return null

Scenario 20: Create a planned expense not executed with description of 101 characters.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense not executed with description of 101 characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Description" with message "Description must be at most 100 characters."
    And data must return null

Scenario 21: Create a planned expense not executed without category.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense not executed without informing category
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "CategoryId" with message "Category is required."
    And data must return null

Scenario 22: Create a planned expense not executed with invalid category.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense not executed with a non-existent category id
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "CategoryId" with message "Category is required."
    And data must return null

# ─────────────────────────────────────────────
# FAILURE SCENARIOS — EXECUTED
# ─────────────────────────────────────────────

Scenario 23: Create a planned expense executed without transaction date.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense executed without informing transaction date
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "TransactionDate" with message "Transaction date is required for executed transactions."
    And data must return null

Scenario 24: Create a planned expense executed without amount.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense executed without informing amount
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Amount" with message "Amount is required and must be greater than 0 for executed transactions."
    And data must return null

Scenario 25: Create a planned expense executed with amount equal to 0.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense executed with amount equal to 0
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Amount" with message "Amount is required and must be greater than 0 for executed transactions."
    And data must return null

Scenario 26: Create a planned expense executed with amount less than 0.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense executed with amount less than 0
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Amount" with message "Amount is required and must be greater than 0 for executed transactions."
    And data must return null

Scenario 27: Create a planned expense executed without amount planned.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense executed without informing amount planned
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "AmountPlanned" with message "Amount planned is required and must be greater than 0."
    And data must return null

Scenario 28: Create a planned expense executed without description.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense executed without informing description
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Description" with message "Description is required."
    And data must return null

Scenario 29: Create a planned expense executed with description of 2 characters.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense executed with description of 2 characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Description" with message "Description must be at least 3 characters."
    And data must return null

Scenario 30: Create a planned expense executed with description of 101 characters.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense executed with description of 101 characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Description" with message "Description must be at most 100 characters."
    And data must return null

Scenario 31: Create a planned expense executed without category.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense executed without informing category
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "CategoryId" with message "Category is required."
    And data must return null

Scenario 32: Create a planned expense executed with invalid category.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense executed with a non-existent category id
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "CategoryId" with message "Category is required."
    And data must return null

# ─────────────────────────────────────────────
# FAILURE SCENARIOS — AUTHENTICATION
# ─────────────────────────────────────────────

Scenario 33: Create a planned expense without authentication.
    [Tags]    PlannedExpense    Failure
    Given that the create transaction endpoint is available
    When create a planned expense without sending the authorization token
    Then the response status code should be "401"
    And must return HasError as "true"
    And must return the message "Unauthorized. Invalid or missing token."
    And data must return null
    And errors must return null
