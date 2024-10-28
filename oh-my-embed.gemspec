# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oh_my_embed/version'

Gem::Specification.new do |spec|
  spec.name = 'oh-my-embed'
  spec.version = OhMyEmbed::VERSION
  spec.authors = ['Axel Wahlen']
  spec.email = ['axelwahlen@gmail.com']

  spec.summary = 'Simple gem to interact with oauth providers'
  spec.description = 'Simple gem to interact with oauth providers, for more informations see spec at http://www.oembed.com'
  spec.homepage = 'https://www.mixxt.de'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0")
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.2'

  spec.add_runtime_dependency 'activesupport', '>= 3.2.21'

  spec.add_development_dependency 'rake', '~> 13.2.1'
  spec.add_development_dependency 'rspec', '~> 3.13.0'
  spec.add_development_dependency 'webmock', '~> 3.24.0'
  spec.add_development_dependency 'vcr', '~> 6.3.1'
  # spec.add_development_dependency 'simplecov', '~> 0.11.2'
  # spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.5.0'
end
