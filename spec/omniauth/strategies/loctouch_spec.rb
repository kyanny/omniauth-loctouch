require 'spec_helper'

describe OmniAuth::Strategies::Picplz do
  before do
    @consumer_key    = 'key'
    @consumer_secret = 'secret'
  end

  subject do
    args = [@client_id, @client_secret, @options].compact
    OmniAuth::Strategies::Picplz.new(nil, *args).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  describe '#consumer' do
    it 'has correct Picplz site' do
      subject.client.site.should eq('http://api.picplz.com')
    end

    it 'has correct access token url' do
      subject.client.token_url.should eq('https://picplz.com/oauth2/access_token')
    end

    it 'has correct authorize url' do
      subject.client.authorize_url.should eq('https://picplz.com/oauth2/authenticate')
    end
  end

  describe '#uid' do
    before :each do
      subject.stub(:raw_info) { { 'id' => '123' } }
    end

    it 'returns the id from raw_info' do
      subject.uid.should eq('123')
    end
  end
end
