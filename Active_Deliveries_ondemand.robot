*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Library				DateTime
Resource			globalElement.robot
Resource      Input_data.robot
Resource			keyword_Login.robot
Resource      keyword_Active_Deliveries.robot

*** Test Cases ***
Display Active Deliveries
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  3s
  Click Link               ${active_delveries_link_menu}
  Sleep  5s
  Element Text Should Be        ${header_element}         ${active_deliveries_txt}
  Check table headers contain text correctly         ${header_orderno_txt}
  Check table headers contain text correctly         ${header_createtime_txt}
  Check table headers contain text correctly        ${header_pickuptime_txt}
  Check table headers contain text correctly         ${header_distance_txt}
  Check table headers contain text correctly         ${header_price_txt}
  Check table headers contain text correctly        ${header_eta_txt}
  Check table headers contain text correctly         ${header_status_txt}
  Click plus icon of order item       1
  Check order item display headers text correctly
