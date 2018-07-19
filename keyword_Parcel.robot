*** Keywords ***

Set many Parcels      [Arguments]     ${parcel_amount}     ${parcel1}    ${parcel2}
  ${i} =  Set Variable		${0}
  ${j} =  Set Variable   ${1}
	:FOR  ${i}  IN RANGE  ${parcel_amount}
  \  ${i} =  Set Variable		${i+1}
  \  Run Keyword If 				${i} > ${parcel_amount} 			Exit For Loop
  \  Sleep  2s
  \  Select parcel          ${parcel1}
  \  Sleep  2s
  \  Select parcel          ${parcel2}
  \  Sleep  5s
  \  Click Element          ${add_more_parcel}
  \  Sleep  2s
  Execute Javascript     ${delete_parcel}.click()
