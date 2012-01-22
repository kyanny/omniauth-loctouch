require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Loctouch < OmniAuth::Strategies::Oauth2
      option :client_options, { 
        :site          => 'http://tou.ch',
        :authorize_url => 'https://tou.ch/oauth2/authenticate',
        :token_url     => 'https://tou.ch/oauth2/token'
      }
      
      def request_phase
        options[:response_type] ||= 'code'
        super
      end
      
      uid { raw_info["id"] }
      
      info do 
        { 
          'name' => raw_info["display_name"],
          'nickname' => raw_info["username"],
          'image' => raw_info["icon"]["url"],
          'urls' => { 'Loctouch' => "http://tou.ch/user/#{raw_info['username']}" }
        }
      end
      
      extra do 
        { :raw_info => raw_info }
      end
      
      def raw_info
        @raw_info ||= begin
                        user_id = access_token.params["user_id"]
                        MultiJson.decode(access_token.get("/v1/users/@self").body)["value"]["users"][0]
                      end
      end
    end
  end
end

OmniAuth.config.add_camelization 'loctouch', 'Loctouch'
