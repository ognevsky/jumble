# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jumble/version'

Gem::Specification.new do |spec|
  spec.name          = 'jumble'
  spec.version       = Jumble::VERSION
  spec.authors       = ['Andrey Ognevsky']
  spec.email         = ['a.ognevsky@gmail.com']
  spec.description   = 'Enable clients pool for twitter'
  spec.summary       = 'Enable clients pool for twitter'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rails', '~> 4.0.1'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'rspec-rails', '~> 2.14.0'
  spec.add_development_dependency 'sqlite3', '~> 1.3.8'

  spec.add_runtime_dependency 'twitter'
end
