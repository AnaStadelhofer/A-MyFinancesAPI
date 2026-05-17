*** Settings ***
Documentation    Test scenarios for Unplanned Expense transactions.
Resource   ../../resources/keywords/base_resource.robot

*** Test Cases ***

# ─────────────────────────────────────────────
# SUCCESS SCENARIOS
# ─────────────────────────────────────────────

Scenario 01: Create an unplanned expense with all required fields.
    [Tags]    UnplannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create an unplanned expense with description, amount, transaction date and category
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction
    And errors must return null

Scenario 02: Create an unplanned expense with payment method informed.
    [Tags]    UnplannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create an unplanned expense with a valid payment method
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction with the payment method
    And errors must return null

Scenario 03: Create an unplanned expense with description of exactly 3 characters.
    [Tags]    UnplannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create an unplanned expense with description of exactly 3 characters
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction
    And errors must return null

Scenario 04: Create an unplanned expense with description of exactly 100 characters.
    [Tags]    UnplannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create an unplanned expense with description of exactly 100 characters
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return the created transaction
    And errors must return null

Scenario 05: Create an unplanned expense and verify IsExecuted is forced to true.
    [Tags]    UnplannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create an unplanned expense sending IsExecuted as false
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return IsExecuted as "true"
    And errors must return null

Scenario 06: Create an unplanned expense and verify AmountPlanned is forced to 0.
    [Tags]    UnplannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create an unplanned expense sending AmountPlanned with a value greater than 0
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return AmountPlanned as "0"
    And errors must return null

Scenario 07: Create an unplanned expense and verify DueDate is forced to null.
    [Tags]    UnplannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create an unplanned expense sending a DueDate value
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return DueDate as null
    And errors must return null

Scenario 08: Create an unplanned expense and verify PlannedDate is forced to null.
    [Tags]    UnplannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create an unplanned expense sending a PlannedDate value
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return PlannedDate as null
    And errors must return null

Scenario 09: Create an unplanned expense without payment method.
    [Tags]    UnplannedExpense    Successfully
    Given that the create transaction endpoint is available
    When create an unplanned expense without informing payment method
    Then the response status code should be "200"
    And must return HasError as "false"
    And must return the message "Transaction created successfully."
    And data must return PaymentMethod as null
    And errors must return null

# ─────────────────────────────────────────────
# FAILURE SCENARIOS
# ─────────────────────────────────────────────

Scenario 10: Create an unplanned expense without transaction date.
    [Tags]    UnplannedExpense    Failure
    Given that the create transaction endpoint is available
    When create an unplanned expense without informing transaction date
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "TransactionDate" with message "Transaction date is required for unplanned expenses."
    And data must return null

Scenario 11: Create an unplanned expense with amount equal to 0.
    [Tags]    UnplannedExpense    Failure
    Given that the create transaction endpoint is available
    When create an unplanned expense with amount equal to 0
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Amount" with message "Amount is required and must be greater than 0 for unplanned expenses."
    And data must return null

Scenario 12: Create an unplanned expense with amount less than 0.
    [Tags]    UnplannedExpense    Failure
    Given that the create transaction endpoint is available
    When create an unplanned expense with amount less than 0
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Amount" with message "Amount is required and must be greater than 0 for unplanned expenses."
    And data must return null

Scenario 13: Create an unplanned expense without description.
    [Tags]    UnplannedExpense    Failure
    Given that the create transaction endpoint is available
    When create an unplanned expense without informing description
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Description" with message "Description is required."
    And data must return null

Scenario 14: Create an unplanned expense with description of 2 characters.
    [Tags]    UnplannedExpense    Failure
    Given that the create transaction endpoint is available
    When create an unplanned expense with description of 2 characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Description" with message "Description must be at least 3 characters."
    And data must return null

Scenario 15: Create an unplanned expense with description of 101 characters.
    [Tags]    UnplannedExpense    Failure
    Given that the create transaction endpoint is available
    When create an unplanned expense with description of 101 characters
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "Description" with message "Description must be at most 100 characters."
    And data must return null

Scenario 16: Create an unplanned expense without category.
    [Tags]    UnplannedExpense    Failure
    Given that the create transaction endpoint is available
    When create an unplanned expense without informing category
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "CategoryId" with message "Category is required."
    And data must return null

Scenario 17: Create an unplanned expense with invalid category.
    [Tags]    UnplannedExpense    Failure
    Given that the create transaction endpoint is available
    When create an unplanned expense with a non-existent category id
    Then the response status code should be "400"
    And must return HasError as "true"
    And must return the message "Validation failed."
    And errors must contain key "CategoryId" with message "Category is required."
    And data must return null

Scenario 18: Create an unplanned expense without authentication.
    [Tags]    UnplannedExpense    Failure
    Given that the create transaction endpoint is available
    When create an unplanned expense without sending the authorization token
    Then the response status code should be "401"
    And must return HasError as "true"
    And must return the message "Unauthorized. Invalid or missing token."
    And data must return null
    And errors must return null
