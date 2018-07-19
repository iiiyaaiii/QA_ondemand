*** Keywords ***

Select current month
  ${tmpmonth} =   	Get Current Date      result_format=%m/%Y
  Select From List        ${date_selection}       ${tmpmonth}

Select month      [Arguments]     ${month}
    ${tmpyear} =   	Get Current Date      result_format=%Y
    ${tmpmonth} =   	Get Current Date      result_format=%m
    ${int_month} =      Convert To Integer    ${month}
    ${int_tmpmonth} =      Convert To Integer    ${tmpmonth}
    ${select_month} =     Run Keyword If    ${int_month} > ${tmpmonth}      Set Variable     ${tmpmonth}/${tmpyear}
    ...                          ELSE IF    ${int_month} <= ${tmpmonth}     Set Variable     ${month}/${tmpyear}
    Log To Console    ${select_month}
    Select From List        ${date_selection}       ${select_month}
