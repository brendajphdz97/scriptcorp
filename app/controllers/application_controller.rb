class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def consume_api(url, params, method)
    uri = URI.parse(url)
    uri.query = URI.encode_www_form(params)

    http = Net::HTTP.new(uri.host, uri.port)
    if(method == "POST") then
      request = Net::HTTP::Post.new(uri.request_uri)
    else
      request = Net::HTTP::Get.new(uri.request_uri)
    end
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(request)
    
    return res
  end
end
