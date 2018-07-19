*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Resource			globalElement.robot
Resource      Input_data.robot
Resource			keyword_Login.robot
Resource			keyword_Settings.robot

*** Test Cases ***
Access to Ondemand web and login successful
	Open Ondemand website
	Login to Ondemand			${username}		${password}
	Check login successful
	Logout from Ondemand

Access to Ondemand web and login fail wrong password
	Open Ondemand website
	Sleep  1s
	Login to Ondemand			${username}		12355665
	Error message should be 					${error_alertmsg}		Incorrect username or password.
