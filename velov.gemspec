# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'velov/version'

Gem::Specification.new do |spec|
  spec.name          = "Velov"
  spec.version       = Velov::VERSION
  spec.authors       = ["Pierre-Baptiste Béchu"]
  spec.email         = ["pb.bechu@gmail.com"]
  spec.summary       = %q{Ruby Wrapper for Velov API (Public Bike Sharing System of Lyon, France)}
  spec.description   = %q{This Wrapper allows you to play with objects like bike's stations ! It's possible to add more features, like "nearest station around me".}
  spec.homepage      = "https://github.com/pbechu/velov"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", '~> 1.7.0'
  spec.add_development_dependency "rake" , '~> 10.3.2'
  spec.add_development_dependency "rspec", '~> 2.99'
  spec.add_development_dependency "vcr", '~> 2.9.2'
  spec.add_development_dependency "webmock", '~> 1.18.0'
 
  spec.add_runtime_dependency     "faraday", '~> 0.9.0'
  spec.add_runtime_dependency     "faraday_middleware", '~> 0.9.1'
  spec.add_runtime_dependency     "virtus", '~> 1.0.3'
end
