*** Variables ***
#Login and Settings
${user_form}					      css=form[name="userForm"]
${error_alertmsg}				    css=div.alert-danger
${Login_menu}					      css=.login-menu
${Login_modal}					    css=#loginTab
${email_field}					    css=#i_email
${pswd_password}				    css=#i_pw
${login_btn}					      css=#b_login
${username_topmenu}				  css=#s_usernamedirective
${username_topmenu_jquery}		s_usernamedirective
${logout_jquery}				    a_logoutdirective
${setting_jquery}				    a_settingsdirective
${change_pswd}					    css=input[name='pw1']
${confirm_change_pswd}			css=input[name='pwc']
${phone}						        css=input[name='iphone']
${submit_jquery}				    b_reg
${setting_name}					    css=input[name="iname"]
${setting_email}				    css=input[name="iemail"]
${setting_phone}				    css=input[name="iphone"]
${setting_address}				  css=input[name="address"]
${setting_language}				  //*[@id="individual"]/div[1]/select

#Pickup
${pickup_tab}               //*[@id="panel-heading-style"]/h4/a/div/span[2]
${pickup_location_input}    css=input[placeholder="Pickup Location - Type to search"]
${pickup_time_input}        css=input[placeholder="Pickup time"]
${pickup_now}               css=span[ng-click="vm.setPickUpNow()"]
${pickup_time_modal}        css=md-dialog-content.dtp-content
${pickup_google_item}       li.icn-google
${nextmonth}                css=div.dtp-month-btn-next
${selected_date}            css=.dtp-select-day.selected
${clock}                    css=.dtp-picker-clock
${hr_beforenoon}            css=#time-hours
${hr_afternoon}             css=#time-24hours
${minute}                     css=#time-minutes
${submit_datetime}          css=.dtp-btn-ok
${submit_pickup}            //*[@id="content1"]/div/div/div/div/div/button
${sender_name}              css=#senderContactName
${sender_phone}             css=#senderPhoneNumber
${sender_email}             css=#senderEmail
${sender_comment}           css=textarea[placeholder="Comments(floor, building - Optional)"]
${dropoff_modal}            css=div.dropoffContainer
${parcel_modal}             css=div.parcelContainer
${tab_element}              $('.editContent span.ng-binding')
${pickup_bookmark}          //*[@id="content1"]/div/div/form/fieldset/div[1]/div/span

#Bookmark
${bookmark_modal}           css=.bookmark-modal
${bookmark_item_name}       css=.bookmarkPicker h4
${usethis_bookmark}         css=.useThis
${input_bookmark_name}      css=input[placeholder="Name of this bookmark"]
${cancel_bookmark}          css=div.cancel
${delete_bookmark}          css=.glyphicon-remove
${input_del_bookmark}       css=Input[placeholder="Bookmark name"]
${alert_warning}            css=div.alert-warning
${bookmark_element_item}    //*[@id="page-top"]/div[4]/div/div/div/div[2]/div[1]

#Dropoff
${dropoff1_location}        css=input[placeholder="Dropoff1 Location"]
${dropoff2_location}        css=input[placeholder="Dropoff2 Location"]
${dropoff3_location}        css=input[placeholder="Dropoff3 Location"]
${dropoff4_location}        css=input[placeholder="Dropoff4 Location"]
${dropoff5_location}        css=input[placeholder="Dropoff5 Location"]
${contact_person1}          css=.dropoffContainer input[placeholder="Contact Person / Company"]
${phone_number1}            css=.dropoffContainer input[placeholder="Phone number"]
${dropoff_comment1}         css=#textinputDropoffComment
${contact_person_element}   $('.dropoffContainer input[placeholder="Contact Person / Company"]')
${phone_number_element}     $('.dropoffContainer input[placeholder="Phone number"]')
${confirmation_modal}       css=#content3
${add_more_dropoff}         css=li#addNewDropoff
${delete_dropoff}           $('.del-dropoff-parcel a.ng-binding')[0]
${dropoff_bookmark}         //*[@id="formDropoff"]/fieldset/div[2]/div/div/div[2]/div[1]/div/span

#Parcel
${parcel_Cash}              .parcelContainer li[tooltip="Cash on delivery"]
${parcel_Food}              .parcelContainer li[tooltip="Hot food delivery"]
${parcel_ID}                .parcelContainer li[tooltip="Photo ID approval"]
${parcel_Return}            .parcelContainer li[tooltip="Return route"]
${parcel_Document}          .parcelContainer li[tooltip="Document processing"]
${parcel_Purchase}          .parcelContainer li[tooltip="Purchase services"]
${parcel_Mailing}           .parcelContainer li[tooltip="Mailing services"]
${parcel_Insurance}         .parcelContainer li[tooltip="Extra Insurance"]
${COD_input}                css=input[placeholder="THB"]
${done_btn}                 css=.done
${parcel_cash_value}        css=.green .service-value
${pacel_insurance_value}    css=.blue .service-value
${complete_parcel_next_btn}          css=button[ng-click="vm.doPriceAndConfirm()"]
${add_more_parcel}          css=.parcelContainer #addNewDropoff
${delete_parcel}            $('.del-dropoff-parcel a.ng-binding')[1]
${parceltab1}               css=.parcelContainer li[heading="1"]
${parceltab2}               css=.parcelContainer li[heading="2"]

#Summary
${summary_pickup_date}      css=div[ng-hide="vm.sendImmediately"]
${dropoff_element}          //*[@id="content3"]/div/div[1]/div/div[3]
${summary_parcel1}          //*[@id="content3"]/div/div[1]/ul/li/div[1]/div[2]/div/div[2]
${summary_parcel2}          //*[@id="content3"]/div/div[1]/ul/li/div[1]/div[2]/div/div[3]
${price-distance}           //*[@id="content3"]/div/div[2]/div
${img_parcel_Return}        /img[1]
${img_parcel_Document}      /img[2]
${img_parcel_Mailing}       /img[3]
${img_parcel_Purchase}      /img[4]
${img_parcel_Cash}          /img[5]
${img_parcel_Food}          /img[6]
${img_parcel_ID}            /img[7]
${img_parcel_Insurance}     /img[8]
${element_parcel}           //*[@id="content3"]/div/div[1]/ul/li/div[1]/div[2]/div
${bookmark_star_pickup}     $('.bookmark.glyphicon-star-empty')[0]
${bookmark_star_dropoff}    $('.bookmark.glyphicon-star-empty')[1]
${summary_pickup_addr}      //*[@id="content3"]/div/div[1]/ul/li/div[1]/h4/div
${summary_dropoff_addr}      //*[@id="content3"]/div/div[1]/ul/li/div[1]/div[2]/div/h4/div
${confirm_summary_btn}       Confirm >

#Payment
${payment_modal}            css=div.payment
${cash_payment_btn}         css=label[for="cash"]
${card_payment_btn}         css=label[for="card"]
${sendit_modal}             css=div.sendit-modal
${sendit_header}            css=div.sendit-modal .header
${sendit_btn}               SEND IT
${sendit_recipient_detail}       css=div.parcelDropoff

#Tracking
${tracking_link_menu}     css=a[href="#!/tracking/active"]
${search_tracking}        css=input#searchText
${results_list}           css=.order-list
${result_id}              /div[1]/small[1]/b
${result_item}            //*[@id="list-view"]/div/ul/li
${dropoff_recipient_name}     .dropOffList .recipient-name
${noorder_element}        css=div.noOrder
${all_loaded_element}     css=div.text-center
${sort_icon}              css=i[title="Sort"]
${sort_by_orderID}        //*[@id="list-view"]/form/div/div/div/ul/li[1]/a
${cut_prefix_order}       Order #
# ${load_more_order_btn}    css=button.btn-loadmoreorder

#Active Deliveries
${active_delveries_link_menu}     css=a[href="#!/active-deliveries"]
${header_element}                 css=h3.title
${active_deliveries_table}        //*[@id="activeDeliveriesTable"][1]
${order_item}                     //*[@id="activeDeliveriesTable"]/tbody
${plus_icon}                      /tr[2]/td[1]
${history_plus_icon}              /tr[1]/td[1]

#History
${history_link_menu}     css=a[href="#!/history"]
${map_icon_1}            //*[@id="activeDeliveriesTable"]/tbody[1]/tr[3]/td[2]/i
${driver_location_modal}          css=div.driverModal

#Export
${date_selection}        dateSelection
${export_link_menu}      css=a[href="#!/export"]
