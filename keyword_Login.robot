*** Keywords ***
Open Ondemand website
	Open Browser 							${url_ondemand_staging}					${browser}
	Maximize Browser Window

Login to Ondemand 			[Arguments]			${username}			${password}
	Wait Until Element Is Visible			${Login_menu}			30s
	Sleep  10s
	Click Element			${Login_menu}
	Sleep  2s
	Element Should Be Visible				${Login_modal}
	Input Text								${email_field}			${username}
	Input Password 							${pswd_password}			${password}
	Click Button							${login_btn}

Check login successful
	Wait Until Element Is Visible			${username_topmenu}		10s
	Element Should Contain					${username_topmenu}		${username}

Logout from Ondemand
	Wait Until Element Is Visible			${username_topmenu}		10s
	Execute Javascript						$('#${username_topmenu_jquery}').click()
	Execute Javascript						$('#${logout_jquery}').click()
	Sleep  3s
	Element Should Not Be Visible 			${username_topmenu}

Error message should be 				[Arguments]			${element}			${error_message}
	Wait Until Element Is Visible				${element}				10s
	${message} = 			Get Text			${element}
	Should Be Equal			${message}			${error_message}

Success message should be 				[Arguments]			${element}			${error_message}
	Wait Until Element Is Visible				${element}				10s
	${message} = 			Get Text			${element}
	Should Be Equal			${message}			${error_message}
