*** Keywords ***

Select Parcel       [Arguments]     ${parcel_type}
  ${css_parcel_type} =        Run Keyword If      '${parcel_type}' == 'ID'
  ...                         Set Variable        ${parcel_ID}
  ...                         ELSE IF            '${parcel_type}' == 'DOCUMENT'
  ...                         Set Variable        ${parcel_Document}
  ...                         ELSE IF            '${parcel_type}' == 'MAILING'
  ...                         Set Variable        ${parcel_Mailing}
  ...                         ELSE IF             '${parcel_type}' == 'FOOD'
  ...                         Set Variable        ${parcel_Food}
  ...                         ELSE IF             '${parcel_type}' == 'RETURN'
  ...                         Set Variable        ${parcel_Return}
  ...                         ELSE IF             '${parcel_type}' == 'PURCHASE'
  ...                         Set Variable        ${parcel_Purchase}
  ...                         ELSE IF             '${parcel_type}' == 'CASH'
  ...                         Set Variable        ${parcel_Cash}
  ...                         ELSE IF             '${parcel_type}' == 'INSURANCE'
  ...                         Set Variable        ${parcel_Insurance}
  Sleep  10s
  Execute Javascript    	    $('${css_parcel_type}').click()
  Run Keyword If              '${parcel_type}' == 'CASH'          Input COD           1500
  ...    ELSE IF              '${parcel_type}' == 'INSURANCE'     Select Insurance    20000

Input COD       [Arguments]     ${amount}
  Sleep  5s
  Input Text                   ${COD_input}       ${amount}
  Click Element                ${done_btn}
  Wait Until Element Is Visible    ${parcel_cash_value}     10s
  ${cash_amount} =             Get Text                     ${parcel_cash_value}
  Should Be Equal              ${cash_amount}               ${amount}

Select Insurance    [Arguments]       ${value}
  Select Radio Button              insurance          ${value}
  Click Element                    ${done_btn}
  Wait Until Element Is Visible    ${pacel_insurance_value}   10s
  ${insurance_amount} =            Get Text                   ${pacel_insurance_value}
  Should Be Equal                  ${insurance_amount}        ${value}

Set Dropoff location     [Arguments]      ${dropoff_element}    ${location}
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Input Text                       ${dropoff_element}      ${location}
  Sleep  3s
  Click Element                    ${dropoff_element}
  Sleep  3s
	Execute Javascript    	$('${pickup_google_item}').click()

Set Dropoff contact person      [Arguments]       ${contact_element}      ${name}
  Click Element                   ${contact_element}
  Input Text                      ${contact_element}          ${name}

Set Dropoff contact phone number      [Arguments]     ${pnone_element}      ${phone}
  Input Text                      ${pnone_element}            ${phone}

Set Dropoff comment       [Arguments]       ${comment_element}      ${comment}
  Input Text                      ${comment_element}         ${comment}

#Add dropoff for loop
Set Dropoff and Parcel      [Arguments]     ${dropoff_amount}     ${parcel1}    ${parcel2}
  ${i} =  Set Variable		${1}
	:FOR  ${index}  IN RANGE  ${dropoff_amount}
	\  Set Dropoff location             ${dropoff${i}_location}       ${dropoff${i}_address}
  \  Sleep  2s
  \  Execute Javascript    	$('${pickup_google_item}').click()
  \  Sleep  2s
  \  Execute Javascript               $(${contact_person_element}[${i-1}]).click()
  \  Execute Javascript               $(${contact_person_element}[${i-1}]).val("${contact_name${i}}")
  \  Execute Javascript               $(${phone_number_element}[${i-1}]).val("${contact_phone${i}}")
  \  Run Keyword If 				'${parcel1}' != 'False' 		  Select parcel          ${parcel1}
  \  Run Keyword If 				'${parcel1}' == 'False' 		  Exit For Loop
  \  Run Keyword If 				'${parcel2}' != 'False' 		  Select parcel          ${parcel2}
  \  Run Keyword If 				'${parcel2}' == 'False' 		  Exit For Loop
	\  ${i} =  Set Variable		${i+1}
	\  Run Keyword If 				${i} > ${dropoff_amount} 			Exit For Loop
  \  Click Element                   ${add_more_dropoff}
