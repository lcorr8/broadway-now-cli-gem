# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'broadway_now/version'

Gem::Specification.new do |spec|
  spec.name          = "broadway_now"
  spec.version       = BroadwayNow::VERSION
  spec.authors       = ["Laura Correa"]
  spec.email         = ["l.corr.v@gmail.com"]

  spec.summary       = %q{Current top 20 Broadway & Off-Broadway shows in NYC, as per www.broadway.com listings.}
  spec.description   = %q{Shows the 20 most popular broadway shows currently playing in NYC, along with details about each show. Popularity of shows determined by www.Broadway.com}
  spec.homepage      = "https://rubygems.org/gems/broadway-now"
  spec.license       = "MIT"

 

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "nokogiri"

end
