*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Library				DateTime
Resource			globalElement.robot
Resource      Input_data.robot
Resource			keyword_Login.robot
Resource      keyword_History.robot
Resource      keyword_Active_Deliveries.robot

*** Test Cases ***
Display History
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  3s
  Click Link               ${history_link_menu}
  Sleep  30s
  Check table headers contain text correctly         ${header_orderno_txt}
  Check table headers contain text correctly         ${header_createtime_txt}
  Check table headers contain text correctly        ${header_pickuptime_txt}
  Check table headers contain text correctly         ${header_distance_txt}
  Check table headers contain text correctly         ${header_price_txt}
  Check table headers contain text correctly        ${header_eta_txt}
  Check table headers contain text correctly         ${header_status_txt}
  Click plus icon of history item       1
  Check history item display headers text correctly
  Check history item display status completed correctly
  Check can click map icon
