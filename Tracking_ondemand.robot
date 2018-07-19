*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Library				DateTime
Library				String
Resource			globalElement.robot
Resource      Input_data.robot
Resource			keyword_Login.robot
Resource			keyword_Settings.robot
Resource			keyword_Pickup.robot
Resource			keyword_Dropoff.robot
Resource      keyword_Parcel.robot
Resource      keyword_Confirmation.robot
Resource      keyword_Payment.robot
Resource      keyword_Tracking.robot

*** Test Cases ***
# Search tracking by ID
#   Open Ondemand website
#   Login to Ondemand			   ${username}				${password}
#   Sleep  3s
#   Click Link               ${tracking_link_menu}
#   Sleep  5s
#   ${orderid} =            Get Text        ${result_id1}
#   Log To Console          ${orderid}
#   Input Text              ${search_tracking}      ${orderid}

Search tracking by Name
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  3s
  Click Link               ${tracking_link_menu}
  Sleep  3s
  Input Text               ${search_tracking}      ${contact_name1}
  Sleep  10s
  Check search results display correctly           css=${dropoff_recipient_name}        ${contact_name1}

Search tracking not found
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  3s
  Click Link               ${tracking_link_menu}
  Sleep  3s
  Input Text               ${search_tracking}      ${search_input_no_result}
  Sleep  10s
  Check no results found

Sort tracking by Order ID
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  3s
  Click Link               ${tracking_link_menu}
  Sleep  3s
  Input Text               ${search_tracking}      ${contact_name1}
  Sleep  10s
  Click Element            ${sort_icon}
  Sleep  5s
  Click Element            ${sort_by_orderID}
  Sleep  2s
  Check sort by Order Id results
