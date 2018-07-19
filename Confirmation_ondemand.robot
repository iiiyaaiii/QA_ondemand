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
Resource			keyword_Dropoff.robot
Resource      keyword_Parcel.robot
Resource      keyword_Confirmation.robot

*** Test Cases ***
Submit parcel successful and display summary
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Create Pickup location					${user_address}
  Set pickup date next month
  Set pickup time					15				20
  Complete sender details
  Click Element    				${submit_pickup}
  Sleep  2s
  Set Dropoff location             ${dropoff1_location}       ${dropoff1_address}
  Sleep  5s
  Set Dropoff contact person       ${contact_person1}          ${contact_name1}
  Set Dropoff contact phone number      ${phone_number1}            ${contact_phone1}
  Set Dropoff comment                   ${dropoff_comment1}         ${contact_comment1}
  Sleep  3s
  Set many Parcels        2       DOCUMENT    ID
  Sleep  3s
  Click Element                    ${complete_parcel_next_btn}
  Sleep  10s
  Element Should Be Visible        ${confirmation_modal}
  Check send date time      3       20
  Element Text Should Be        ${dropoff_element}     1 DROPOFF
  Check parcels summary detail    1     1     DOCUMENT
  Check parcels summary detail    1     2     ID
  Check parcels summary detail    1     3     INSURANCE
  Check parcels summary detail    2     1     DOCUMENT
  Check parcels summary detail    2     2     ID
  Check parcels summary detail    2     3     INSURANCE

Add pickup address to bookmark successful
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  10s
  Clear all bookmarks
  Create Pickup location					${user_address}
  Set pickup date next month
  Set pickup time					15				20
  Complete sender details
  Click Element    				${submit_pickup}
  Sleep  2s
  Set Dropoff location             ${dropoff1_location}       ${dropoff1_address}
  Sleep  5s
  Set Dropoff contact person       ${contact_person1}          ${contact_name1}
  Set Dropoff contact phone number      ${phone_number1}            ${contact_phone1}
  Set Dropoff comment                   ${dropoff_comment1}         ${contact_comment1}
  Select Parcel                    DOCUMENT
  Sleep  3s
  Click Element                    ${complete_parcel_next_btn}
  Sleep  3s
  Bookmark address                 PICKUP       ${bookmark_star_pickup}        ${pickup_bookmark_name}
  Sleep  2s
  Use this address
  Click Element                    ${done_btn}
  Sleep  10s
  Click Element    				         ${submit_pickup}
  Sleep  5s
  Click Element                    ${complete_parcel_next_btn}
  Element Should Be Visible        ${confirmation_modal}
  Check bookmark address display in summary     ${summary_pickup_addr}     ${user_address}
  Sleep  2s
  Click tab                        PICKUP
  Clear all bookmarks

Add dropoff address to bookmark successful
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  10s
  Clear all bookmarks
  Create Pickup location					${user_address}
  Set pickup date next month
  Set pickup time					15				20
  Complete sender details
  Click Element    				${submit_pickup}
  Sleep  2s
  Set Dropoff location             ${dropoff1_location}       ${dropoff2_address}
  Sleep  5s
  Set Dropoff contact person       ${contact_person1}          ${contact_name1}
  Set Dropoff contact phone number      ${phone_number1}            ${contact_phone1}
  Set Dropoff comment                   ${dropoff_comment1}         ${contact_comment1}
  Select Parcel                    DOCUMENT
  Sleep  3s
  Click Element                    ${complete_parcel_next_btn}
  Sleep  3s
  Bookmark address                 DROPOFF        ${bookmark_star_dropoff}        ${dropoff_bookmark_name}
  Sleep  2s
  Use this address
  Click Element                    ${done_btn}
  Sleep  5s
  Click Element                    ${complete_parcel_next_btn}
  Sleep  5s
  Element Should Be Visible        ${confirmation_modal}
  Check bookmark address display in summary     ${summary_dropoff_addr}     ${dropoff2_address}
  Click tab                        PICKUP
  Clear all bookmarks

Search bookmark successful
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  10s
  Clear all bookmarks
  Create Pickup location					${user_address}
  Set pickup date next month
  Set pickup time					11				30
  Complete sender details
  Click Element    				${submit_pickup}
  Sleep  2s
  Set Dropoff location             ${dropoff1_location}       ${dropoff4_address}
  Sleep  5s
  Set Dropoff contact person       ${contact_person1}          ${contact_name1}
  Set Dropoff contact phone number      ${phone_number1}            ${contact_phone1}
  Set Dropoff comment                   ${dropoff_comment1}         ${contact_comment1}
  Select Parcel                    DOCUMENT
  Sleep  3s
  Click Element                    ${complete_parcel_next_btn}
  Sleep  3s
  Bookmark address                 PICKUP       ${bookmark_star_pickup}        ${pickup_bookmark_name}
  Check bookmark item              1            ${pickup_bookmark_name}
  Sleep  5s
  Click Element                    ${cancel_bookmark}
  Sleep  5s
  Click tab                        DROPOFF
  Sleep  5s
  Click Element                    ${complete_parcel_next_btn}
  Sleep  3s
  Bookmark address                 DROPOFF        ${bookmark_star_dropoff}      ${dropoff4_address}
  Check bookmark item              2              ${dropoff4_address}
  Sleep  3s
  Search bookmark                  ${dropoff4_address}
  Sleep  5s
  Click Element                    ${cancel_bookmark}
  Sleep  5s
  Click tab                        PICKUP
  Clear all bookmarks

Delete bookmark fail input incorrect bookmark name
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  10s
  Clear all bookmarks
  Create Pickup location					${user_address}
  Set pickup date next month
  Set pickup time					11				30
  Complete sender details
  Click Element    				${submit_pickup}
  Sleep  2s
  Set Dropoff location             ${dropoff1_location}       ${dropoff4_address}
  Sleep  5s
  Set Dropoff contact person       ${contact_person1}          ${contact_name1}
  Set Dropoff contact phone number      ${phone_number1}            ${contact_phone1}
  Set Dropoff comment                   ${dropoff_comment1}         ${contact_comment1}
  Select Parcel                    DOCUMENT
  Sleep  3s
  Click Element                    ${complete_parcel_next_btn}
  Sleep  3s
  Bookmark address                 PICKUP       ${bookmark_star_pickup}        ${pickup_bookmark_name}
  Sleep  5s
  Delete bookmark                  ${dropoff4_address}
  Element Should Be Visible        ${alert_warning}
  Error message should be          ${alert_warning}        Bookmark name mismatch

Delete bookmark successful
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  10s
  Clear all bookmarks
  Create Pickup location					${user_address}
  Set pickup date next month
  Set pickup time					11				30
  Complete sender details
  Click Element    				${submit_pickup}
  Sleep  2s
  Set Dropoff location             ${dropoff1_location}       ${dropoff4_address}
  Sleep  5s
  Set Dropoff contact person       ${contact_person1}          ${contact_name1}
  Set Dropoff contact phone number      ${phone_number1}            ${contact_phone1}
  Set Dropoff comment                   ${dropoff_comment1}         ${contact_comment1}
  Select Parcel                    DOCUMENT
  Sleep  3s
  Click Element                    ${complete_parcel_next_btn}
  Sleep  3s
  Bookmark address                 PICKUP       ${bookmark_star_pickup}        ${pickup_bookmark_name}
  Sleep  5s
  Delete bookmark                   ${pickup_bookmark_name}
  Success message should be         ${alert_warning}        Deleted ${pickup_bookmark_name}
  Sleep  5s
  Element Should Not Be Visible     ${bookmark_item_name}
