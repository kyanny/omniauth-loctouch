require 'bundler/setup'
require 'rspec'
Dir[File.expand_path('../support/**/*', __FILE__)].each { |f| require f }

require 'omniauth-loctouch'

RSpec.configure do |config|
end
