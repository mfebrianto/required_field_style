# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'required_field_style/version'

Gem::Specification.new do |spec|
  spec.name          = "required_field_style"
  spec.version       = RequiredFieldStyle::VERSION
  spec.authors       = ["Michael Febrianto"]
  spec.email         = ["michaelfebrianto@gmail.com"]
  spec.summary       = %q{This gem will add asterisk after your required field label}
  spec.description   = %q{This gem will add asterisk after your required field label}
  spec.homepage      = "http://www.mfebrianto.com"
  spec.license       = ""

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 2.3.11"
  spec.add_dependency "rack", "~> 1.1.6"
  spec.add_dependency "validation_reflection", "~> 0.3.8"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 1.3.0"
  spec.add_development_dependency "rspec-rails", "~> 1.3.0"
  spec.add_development_dependency "sqlite3"
end
