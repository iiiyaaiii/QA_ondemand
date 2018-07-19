*** Keywords ***
Click Settings menu
	Execute Javascript						$('#${username_topmenu_jquery}').click()
	Sleep  3s
	Execute Javascript						$('#${setting_jquery}').click()
	Sleep  3s

Change password				[Arguments]			${newpswd}			${confirmpswd}
	Click Settings menu
	Wait Until ELement Is Visible		${change_pswd}			10s
	Input Text 							${change_pswd}			${newpswd}
	Input Text 							${confirm_change_pswd}			${confirmpswd}
