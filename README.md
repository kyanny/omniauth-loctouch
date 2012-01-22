# Omniauth Loctouch [![Build Status](https://secure.travis-ci.org/kyanny/omniauth-loctouch.png)](http://travis-ci.org/kyanny/omniauth-loctouch)

Strategy to auth with Loctouch via OAuth2.0 in OmniAuth.

Get your API key at https://tou.ch/developer/apps/

Be sure when you register callback url will be "http://sample.com/auth/loctouch/callback"

## Basic Usage

    use OmniAuth::Builder do
      provider "loctouch", ENV['LOCTOUCH_CLIENT_ID'], ENV['LOCTOUCH_CLIENT_SECRET']
    end

## Ruby

Tested with the following Ruby versions:

- MRI 1.8.7
- MRI 1.9.2
- MRI 1.9.3

## License

MIT License http://kyanny.mit-license.org/
