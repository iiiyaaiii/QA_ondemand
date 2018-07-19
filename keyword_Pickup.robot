*** Keywords ***

Create Pickup location    [Arguments]     ${address}
  Sleep  20s
  Wait Until Element Is Visible        ${pickup_location_input}   5s
  Input Text               ${pickup_location_input}       ${address}
  Click Element						${pickup_location_input}
  Sleep  5s
  Execute Javascript    	$($('${pickup_google_item}')[0]).click()
  Sleep  5s

Set pickup date next month
  Click Element            ${pickup_time_input}
  Sleep  5s
  Element Should Be Visible         ${pickup_time_modal}
  Click Element											${nextmonth}
  Element Should Be Visible    			${selected_date}
  Click Element											${submit_datetime}

Set pickup time        [Arguments]       ${input_hr}       ${input_min}
  ${input_hr} =   Convert To Integer    ${input_hr}
  ${tmphour} =   	Get Current Date      result_format=%H
  ${tmphour} =    Convert To Integer    ${tmphour}
  ${pickup_hr} =   Set Variable         ${input_hr}
  # Log To Console          ${tmphour}
  ${present_time}=   Run Keyword And Return Status    Should Be Equal    ${input_hr}   ${tmphour}
  # Log To Console    ${present_time}
  ${pickup_hr}=   Run Keyword If      ${present_time} == True       Set Variable      ${input_hr+1}
  ...             ELSE IF             ${present_time} == False      Set Variable      ${input_hr}
  # Log To Console          ${pickup_hr}
  ${hour}=        Run Keyword If      ${pickup_hr} < 12             Set Variable      ${hr_beforenoon}
  ...                     ELSE IF     ${pickup_hr} >= 12            Set Variable      ${hr_afternoon}
  Click Element    				${hour}-${pickup_hr}
  Sleep  3s
  Click Element						${submit_datetime}
  Sleep  5s
  Click Element						${minute}-${input_min}
  Sleep  3s
  ${present} =  Run Keyword And Return Status    Element Should Be Visible   ${submit_datetime}
  Run Keyword If    ${present} == True    Click Element		${submit_datetime}

Complete sender details
  Input Text							${sender_name}							${settinguser_name}
  Input Text							${sender_phone}							${user_phone}
  Input Text							${sender_email}							${settinguser_email}
  Input Text							${sender_comment}						${user_pickup_comment}
