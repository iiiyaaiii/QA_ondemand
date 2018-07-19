*** Variables ***
#Login and Settings
${browser}						      chrome
${url_ondemand_staging}			https://staging-customer.sendit.asia/
${username}						      Tester1@sendit.asia
${password}						      12345678
${defaultuser_name}				  Panuwit S.
${defaultuser_email}			  tester1@sendit.asia
${defaultuser_phone}			  022020022
${defaultuser_address}			Bangkok
${newpassword}					    new12345
${settinguser_name}				  Ms.Pitchaya
${settinguser_email}			  pitchaya_ket@sendit.asia
${user_phone}					      0929929992
${user_address}					    Richmond Office Building

#Pickup
${user_pickup_comment}      18th floor

#Bookmark
${pickup_bookmark_name}     Sendit Richmond Office
${dropoff_bookmark_name}    AIA Ascend

#Dropoff 1
${dropoff1_address}         Q. House Lumpini
${contact_name1}            สมชาย  ขายดี
${contact_phone1}           0925554545
${contact_comment1}         Level 12

#Dropoff 2
${dropoff2_address}         AIA
${contact_name2}            สมใจ  ขายดี
${contact_phone2}           0926667676

#Dropoff 3
${dropoff3_address}         Interchange Tower
${contact_name3}            สุขใจ  ขายดี
${contact_phone3}           0928989988

#Dropoff 4
${dropoff4_address}         FYI Center
${contact_name4}            อยู่สบาย  ขายดี
${contact_phone4}           0981239898

#Dropoff 5
${dropoff5_address}         CP Tower
${contact_name5}            พรชัย  ขายดี
${contact_phone5}           0988689958

#Payment
${sendit_payment_success_header}        Thank you for your order

#Tracking
${search_input_no_result}   !@#$% ___No results
${no_order_message}         No order found
${all_loaded_message}       All order loaded

#Active Deliveries
${url_ondemand_activedelivery}			    https://staging-customer.sendit.asia/#!/active-deliveries
${active_deliveries_txt}                Active Deliveries
${header_orderno_txt}                   Order No.
${header_createtime_txt}                Created Time
${header_pickuptime_txt}                Pickup Time
${header_distance_txt}                  Distance
${header_price_txt}                     Price
${header_eta_txt}                       ETA
${header_status_txt}                    Status
${assignment_txt}                       Assignment ID
${pickup_txt}                           Pickup Location
${driver_txt}                           Driver Name
${driver_phone_txt}                     Phone Number
${pickup_duration_txt}                  Waiting Duration
${jobno_txt}                            Job No.
${dropoff_txt}                          Dropoff
${parcel_txt}                           Parcel
${distance_txt}                         Distance
${dropoff_duration_txt}                 Waiting Duration
${dropoff_eta_txt}                      ETA
${dropoff_status_txt}                   Status

#Export
${export_txt}           CSV Export
