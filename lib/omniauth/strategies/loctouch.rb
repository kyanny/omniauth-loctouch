require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Loctouch < OmniAuth::Strategies::OAuth2
      option :client_options, { 
        :site          => 'https://api.loctouch.com',
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
          'nickname' => raw_info["display_name"],
          'image'    => raw_info["icon"],
          'urls'     => { 'Loctouch' => raw_info["link"] }
        }
      end
      
      extra do 
        { :raw_info => raw_info }
      end
      
      def raw_info
        @raw_info ||= begin
                        MultiJson.decode(access_token.get("/v1/users/@self").body)["user"]
                      end
      end
    end
  end
end

OmniAuth.config.add_camelization 'loctouch', 'Loctouch'
