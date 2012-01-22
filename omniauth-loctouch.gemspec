# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-loctouch/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-loctouch"
  s.version     = Omniauth::Loctouch::VERSION
  s.authors     = ["Kensuke Nagae"]
  s.email       = ["kyanny@gmail.com"]
  s.homepage    = "https://github.com/banyan/omniauth-loctouch"
  s.summary     = %q{OmniAuth strategy for Loctouch}
  s.description = s.summary

  s.rubyforge_project = "omniauth-loctouch"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "omniauth-oauth2", '~> 1.0'
  s.add_runtime_dependency "multi_json", '~> 1.0.4'

  s.add_development_dependency "rspec", '~> 2.7'
  s.add_development_dependency "rake"
end
