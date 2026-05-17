*** Settings ***

*** Variables ***
${BASE_URL}    %{BASE_URL}
#${BASE_URL}    https://myfinancesapi-staging.up.railway.app

${ENDPOINT_LOGIN}           ${BASE_URL}/api/auth/login
${ENDPOINT_REGISTER}        ${BASE_URL}/api/auth/register
${ENDPOINT_BANK}            ${BASE_URL}/api/bank


# ✅ USUÁRIO VÁLIDO
${VALID_EMAIL}                    %{VALID_EMAIL}
${VALID_PASSWORD}                 %{VALID_PASSWORD}
${VALID_NAME_USER}                %{VALID_NAME_USER}

# USER ADM
${ADMIN_EMAIL}                    %{ADMIN_EMAIL}
${ADMIN_PASSWORD}                 %{ADMIN_PASSWORD}
${NAME_ADM}                       %{NAME_ADM}

