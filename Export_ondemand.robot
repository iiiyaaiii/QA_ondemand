*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Library				DateTime
Resource			globalElement.robot
Resource      Input_data.robot
Resource			keyword_Login.robot
Resource      keyword_Export.robot

*** Test Cases ***
Select month and export order successful
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  3s
  Click Link               ${export_link_menu}
  Sleep  5s
  Element Text Should Be        ${header_element}         ${export_txt}
  Select month             06
  Click Button       Export
  Sleep  3s
  Select current month
  Click Button       Export
  Sleep  3s
