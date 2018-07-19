*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Resource			globalElement.robot
Resource      Input_data.robot
Resource			keyword_Login.robot
Resource			keyword_Settings.robot

*** Test Cases ***
Edit user name phone and address successful
	Open Ondemand website
	Login to Ondemand			${username}				${password}
	Click Settings menu
	Wait Until Element Is Visible		${user_form}			10s
	Input Text						${setting_name}				${settinguser_name}
	Input Text						${setting_email}			${settinguser_email}
	Input Text 						${setting_phone}			${user_phone}
	Input Text 						${setting_address}		${user_address}
	Click Element 				${setting_phone}
	Execute Javascript			$('#${submit_jquery}').click()
	#Reset to default data
	Click Settings menu
	Wait Until Element Is Visible		${user_form}			10s
	Input Text 						${setting_name}				${defaultuser_name}
	Input Text						${setting_email}			${defaultuser_email}
	Input Text 						${setting_phone}			${defaultuser_phone}
	Input Text 						${setting_address}		${defaultuser_address}
	Click Element 				${setting_phone}
	Execute Javascript			$('#${submit_jquery}').click()

Change password and login successful
	Open Ondemand website
	Login to Ondemand				${username}				${password}
	Sleep  5s
	Change password					${newpassword}		${newpassword}
	Sleep  5s
	Click Element						${setting_email}
	Execute Javascript			$('#${submit_jquery}').click()
	Logout from Ondemand
	Login to Ondemand				${username}				${newpassword}
	Sleep  5s
	Change password					${password}				${password}
	Sleep  5s
	Click Element						${setting_email}
	Execute Javascript			$('#${submit_jquery}').click()
	Logout from Ondemand
	Login to Ondemand				${username}				${password}
	Logout from Ondemand

Change password fail input wrong confirm password
	Open Ondemand website
	Login to Ondemand				${username}				${password}
	Sleep  5s
	Change password					${newpassword}		${password}
	Sleep  5s
	Click Element    				${setting_phone}
	Error message should be 	css=p[ng-message="compareto"]		Passwords must be the same

Change language
	Open Ondemand website
	Login to Ondemand				${username}				${password}
	Sleep  31s
	Click Settings menu
	Select From List				${setting_language}			Thai
	Sleep  3s
	Execute Javascript			$('#${submit_jquery}').click()
	Sleep  3s
	Element Should Contain					${pickup_tab} 				สถานที่รับพัสดุ
	Click Settings menu
	Select From List				${setting_language}			English
	Sleep  3s
	Execute Javascript			$('#${submit_jquery}').click()
	Reload Page
	Sleep  3s
	Element Should Not Contain			${pickup_tab} 				สถานที่รับพัสดุ
