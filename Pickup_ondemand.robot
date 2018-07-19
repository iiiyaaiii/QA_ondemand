*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Library				DateTime
Resource			globalElement.robot
Resource      Input_data.robot
Resource			keyword_Login.robot
Resource			keyword_Settings.robot
Resource			keyword_Pickup.robot

*** Test Cases ***
Create Pickup successful
	Open Ondemand website
	Login to Ondemand			   ${username}				${password}
  Create Pickup location					${user_address}
	Set pickup date next month
  Set pickup time					17				50
  Complete sender details
  Click Element    				${submit_pickup}
	Sleep  2s
	Element Should Be Visible				${dropoff_modal}
	Element Should Be Visible       ${parcel_modal}

Create Pickup fail incomplete required fields
	Open Ondemand website
	Login to Ondemand			   ${username}				${password}
	Create Pickup location					${user_address}
	Set pickup date next month
	Set pickup time					17				50
	Sleep  3s
	Clear Element Text   		${sender_name}
	Clear Element Text			${sender_phone}
	Element Should Be Disabled    					${submit_pickup}

Create Pickup now successful
	Open Ondemand website
	Login to Ondemand			   ${username}				${password}
	Create Pickup location					${user_address}
  Sleep  5s
	Click Element						${pickup_now}
	Complete sender details
	Click Element    				${submit_pickup}
	Sleep  5s
 	Element Should Be Visible				${dropoff_modal}
 	Element Should Be Visible       ${parcel_modal}
