# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smart_methods/version'

Gem::Specification.new do |spec|
  spec.name          = "smart_methods"
  spec.version       = SmartMethods::VERSION
  spec.authors       = ["Andrey Deryabin"]
  spec.email         = ["deriabin@gmail.com"]
  spec.description   = %q{smart_methods helps to define class and instance methods using pretty DSL}
  spec.summary       = %q{smart_methods helps to define class and instance methods using pretty DSL}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "turn"
end
