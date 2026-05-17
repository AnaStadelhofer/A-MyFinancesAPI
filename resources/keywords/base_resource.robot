*** Settings ***
## Keywords
Resource    assertions_keywords.robot
Resource    requests_keywords.robot
Resource    user/register_keywords.robot
Resource    user/get_users_keywords.robot
Resource    auth/auth_keywords.robot
Resource    banks/banks_keywords.robot

## Variables
Resource    ../variables/global_variables.robot

Library    RequestsLibrary
Library    Collections
Library    FakerLibrary
