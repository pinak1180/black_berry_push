black_berry_push
================
Usage
you have to install gem rest-client and in application.rb you need to specify
"require push"

You need to pass
:app_id=> which you will get from bis server



:pass=> password provided for app id


:pin=> you can pass multiple like ["xxxxxxx","xxxxxxxxx"]


:content=>your message content.


:push_api_url=>(optional) if you have it you can pass it else default will be "https://pushapi.eval.blackberry.com/mss/PD_pushRequest"



Example

 Push.new({:app_id=>"app_id" ,:pass=>"password",:pin=>["",""],:content=>"from Black_berry_push"})
 
 
 
 
 
 
 That's it now you can use this gem for sending push-notification to any blackberry devices.

if you still have any doubt you can contact me at pinak.0605@gmail.com.
