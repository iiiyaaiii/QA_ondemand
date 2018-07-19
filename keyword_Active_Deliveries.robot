*** Keywords ***

Check table headers contain text correctly    [Arguments]     ${text}
  Table Header Should Contain    ${active_deliveries_table}       ${text}

Click plus icon of order item     [Arguments]      ${item_no}
  Click Element         ${order_item}[${item_no}]${plus_icon}

Check order item display headers text correctly
  Table Row Should Contain            ${active_deliveries_table}      3     ${assignment_txt}
  Table Row Should Contain            ${active_deliveries_table}      3     ${pickup_txt}
  Table Row Should Contain            ${active_deliveries_table}      3     ${driver_txt}
  Table Row Should Contain            ${active_deliveries_table}      3     ${driver_phone_txt}
  Table Row Should Contain            ${active_deliveries_table}      3     ${pickup_duration_txt}
  Table Row Should Contain            ${active_deliveries_table}      5     ${jobno_txt}
  Table Row Should Contain            ${active_deliveries_table}      5     ${dropoff_txt}
  Table Row Should Contain            ${active_deliveries_table}      5     ${parcel_txt}
  Table Row Should Contain            ${active_deliveries_table}      5     ${distance_txt}
  Table Row Should Contain            ${active_deliveries_table}      5     ${dropoff_duration_txt}
  Table Row Should Contain            ${active_deliveries_table}      5     ${dropoff_eta_txt}
  Table Row Should Contain            ${active_deliveries_table}      5     ${dropoff_status_txt}
