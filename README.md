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

Example

 Push.new({:app_id=>"app_id" ,:pass=>"password",:pin=>["",""],:content=>"from Black_berry_push"})
 That's it now you can use this gem for sending push-notification to any blackberry devices.
