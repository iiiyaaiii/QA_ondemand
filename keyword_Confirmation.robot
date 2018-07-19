*** Keywords ***

Check send date time      [Arguments]     ${hour}     ${minute}
  ${present_date} =   	Get Current Date     result_format=%d
  ${present_month} =    Get Current Date     result_format=%m
  ${present_year} =    Get Current Date      result_format=%Y
  ${present_hour} =    Get Current Date     result_format=%I
  ${present_hour} =    Convert To Integer    ${present_hour}
  ${tmp_hour} =        Convert To Integer    ${hour}
  ${present_time}=   Run Keyword And Return Status    Should Be Equal    ${tmp_hour}   ${present_hour}
  ${pickup_hr}=   Run Keyword If      ${present_time} == True       Set Variable      ${tmp_hour+1}
  ...             ELSE IF             ${present_time} == False      Set Variable      ${tmp_hour}
  ${month} =           Convert To Integer         ${present_month}
  ${month} =           Set Variable          ${month+1}
  ${n_month} =          Convert To String         ${month}
  ${n_month} =        Run Keyword If         ${month} < 10    Set Variable    0${month}
  ${date_next_month} =       Set Variable         ${n_month}/${present_date}/${present_year}
  ${date_time_send} =        Set Variable     ${date_next_month} ${pickup_hr}:${minute}
  ${send_datetime} =    Get Text              ${summary_pickup_date}
  Should Contain       ${send_datetime}       ${date_time_send}

Check parcels summary detail    [Arguments]       ${parcel_no}    ${item_no}    ${parcel_type}
  ${img_parcel_type} =        Run Keyword If      '${parcel_type}' == 'ID'
  ...                         Set Variable        ${img_parcel_ID}
  ...                         ELSE IF             '${parcel_type}' == 'DOCUMENT'
  ...                         Set Variable        ${img_parcel_Document}
  ...                         ELSE IF             '${parcel_type}' == 'MAILING'
  ...                         Set Variable        ${img_parcel_Mailing}
  ...                         ELSE IF             '${parcel_type}' == 'FOOD'
  ...                         Set Variable        ${img_parcel_Food}
  ...                         ELSE IF             '${parcel_type}' == 'RETURN'
  ...                         Set Variable        ${img_parcel_Return}
  ...                         ELSE IF             '${parcel_type}' == 'PURCHASE'
  ...                         Set Variable        ${img_parcel_Purchase}
  ...                         ELSE IF             '${parcel_type}' == 'CASH'
  ...                         Set Variable        ${img_parcel_Cash}
  ...                         ELSE IF             '${parcel_type}' == 'INSURANCE'
  ...                         Set Variable        ${img_parcel_Insurance}
  ${parcel_no} =           Convert To Integer         ${parcel_no}
  ${parcel_no} =           Set Variable          ${parcel_no+1}
  ${element_parcel} =        Set Variable        ${element_parcel}/div[${parcel_no}]/div[${item_no}]
  Element Should Be Visible     ${element_parcel}${img_parcel_type}
  Element Should Be Visible     ${summary_parcel1}
  Element Should Be Visible     ${summary_parcel2}
  Element Should Be Visible     ${price-distance}

CLick tab         [Arguments]         ${tab_name}
  ${tab_item} =        Run Keyword If      '${tab_name}' == 'PICKUP'
  ...                         Set Variable        $(${tab_element}[0])
  ...                         ELSE IF             '${tab_name}' == 'DROPOFF'
  ...                         Set Variable        $(${tab_element}[1])
  ...                         ELSE IF             '${tab_name}' == 'CONFIRMATION'
  ...                         Set Variable        $(${tab_element}[4])
  ...                         ELSE IF             '${tab_name}' == 'PAYMENT'
  ...                         Set Variable        $(${tab_element}[5])
  Execute Javascript          ${tab_item}.click()

Bookmark address         [Arguments]        ${tab}       ${bookmark_star_element}        ${bookmark_name}
  Execute Javascript      $(${bookmark_star_element}).click()

  Wait Until Element Is Visible    ${input_bookmark_name}     10s
  Input Text                       ${input_bookmark_name}     ${bookmark_name}
  Click Element                    ${done_btn}
  Sleep  3s
  Click tab                        ${tab}
  Sleep  5s
  ${bookmark_item} =          Run Keyword And Return Status         Should Be Equal    ${tab}     PICKUP
  Run Keyword If        ${bookmark_item} == True       Click Element      ${pickup_bookmark}
  ...    ELSE IF        ${bookmark_item} == False      Click Element      ${dropoff_bookmark}

Check bookmark item         [Arguments]     ${item_no}      ${bookmark_name}
  Element Should Be Visible       ${bookmark_modal}
  Sleep  10s
  ${bookmark_address} =           Get Text                    ${bookmark_element_item}/div[${item_no}]/h4
  Should Be Equal                 ${bookmark_address}         ${bookmark_name}

Use this address
  Click Element                   ${bookmark_item_name}
  Sleep  3s
  Click Element                   ${usethis_bookmark}

Search bookmark         [Arguments]       ${bookmark_name}
  Input Text                      css=input[placeholder="Search"]       ${bookmark_name}
  Sleep  2s
  ${bookmark_address} =           Get Text                    ${bookmark_item_name}
  Should Be Equal                 ${bookmark_address}         ${bookmark_name}

Check bookmark address display in summary       [Arguments]         ${element}        ${bookmark_address}
  ${summary_address} =            Get Text        ${element}
  Should Contain                  ${summary_address}        ${bookmark_address}

Delete bookmark         [Arguments]       ${bookmark}
  Click Element                    ${delete_bookmark}
  Input Text                       ${input_del_bookmark}       ${bookmark}
  Click Button                     CONFIRM DELETE

Clear all bookmarks
  Click Element       ${pickup_bookmark}
  Sleep  3s
  ${length} =			Get Element Count 				${bookmark_item_name}
  ${i} =  Set Variable		${0}
  :FOR  ${index}  IN RANGE  ${length}
  \  ${bookmark_item} =          Run Keyword And Return Status         Element Should Be Visible      ${bookmark_item_name}
  \  ${name} =        Run Keyword If        ${bookmark_item} == True      Get Text        ${bookmark_item_name}
  \  ...                    ELSE IF         ${bookmark_item} == False     Exit For Loop
  \  Click Element                    ${delete_bookmark}
  \  Input Text                       ${input_del_bookmark}       ${name}
  \  Click Button                     CONFIRM DELETE
  \  ${i} =  Set Variable		${i+1}
	\  Run Keyword If 				${i} > ${length}			Exit For Loop
  \  Sleep  5s
  Sleep  10s
  Click Element            ${cancel_bookmark}
