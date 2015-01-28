require 'net/http'
require 'net/https'
require 'uri'
require 'rubygems'
require 'restclient'
  class Push
    attr_accessor :pin,:content,:push_api_url,:app_id ,:pass
    attr_reader :boundry,:push_id,:delivery_method,:delivery_before,:content_type
     def initialize(options={})
      @app_id = options[:app_id]
      @pass = options[:pass]
      @push_api_url = options[:push_api_url]||"https://pushapi.eval.blackberry.com/mss/PD_pushRequest"
      @pin = options[:pin]
      @addresses = []
      @pin.each do |a|
        @addresses << "<address address-value=\"#{a}\"/>\n"
      end
      @content = options[:content]
      @boundary='fghjkklllmnggddcvjjkkm'
      @push_id=Time.now.to_i  # ID requires to be more than 10 digits
      @delivery_method='unconfirmed'
      @t= Time.now+(60*5)
      @delivery_before=@t.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
      @content_type="Content-Type: multipart/related; boundary=" + @boundary + "; type=application/xml"
      send_push
     end

 def data 
 data="--#{@boundary}
 Content-Type: application/xml; charset=UTF-8
<?xml version='1.0'?>
<!DOCTYPE pap PUBLIC '-//WAPFORUM//DTD PAP 2.1//EN' 'http://www.openmobilealliance.org/tech/DTD/pap_2.1.dtd'>
<pap>
  <push-message push-id='#{@push_id}' deliver-before-timestamp='#{@delivery_before}' source-reference='#{@app_id}'>
    #{@addresses.join("\n")}
    <custome>pinak</custome>
    <quality-of-service delivery-method='#{@delivery_method}'/>
  </push-message>
</pap>
--#{@boundary}
Content-Type: text/plain
Push-Message-ID:#{@push_id}

#{@content}
--#{@boundary}--"
end
def send_push 
response = RestClient::Request.execute(:method => :post,
  :url =>@push_api_url,
  :payload => data,
  :headers=> {
    :content_type=> @content_type,
#    :authorization => auth,    
    :user_agent=> "User-Agent: Yuichi@Idea BB Push Server/1.0"
  },
  :user=> @app_id,
  :password=> @pass
)
end
end