*** Keywords ***

Select payment by     [Arguments]       ${type}
  Element Should Be Visible         ${payment_modal}
  Sleep  5s
  Run Keyword If              '${type}' == 'CASH'             Click Element       ${cash_payment_btn}
  ...         ELSE IF         '${type}' == 'CREDIT CARD'      Click Element       ${card_payment_btn}
  Sleep  3s
  Click Button                      ${sendit_btn}


Check payment success
  Element Should Be Visible         ${sendit_modal}
  ${header} =                Get Text     ${sendit_header}
  Should Be Equal                   ${header}           ${sendit_payment_success_header}
  ${recipient_detail} =             Get Text            ${sendit_recipient_detail}
  Should Contain                    ${recipient_detail}       ${contact_name1}
  Should Contain                    ${recipient_detail}      ${contact_phone1}
  Click Element                     ${done_btn}
  Sleep  5s
  ${current_url} =                  Get Location
  Should Be Equal                   ${current_url}    ${url_ondemand_activedelivery}#referToTopPoint
