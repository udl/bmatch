# encoding: utf-8
require File.expand_path('../lib/bmatch/version', __FILE__)

Gem::Specification.new do |s|
  s.name = "bmatch"
  s.version = Bmatch::VERSION
  s.authors = ["Udo Groebner"]
  s.email = "udo.groebner@crealytics.com"
  s.homepage = "https://github.com/udl/bmatch"
  s.licenses = ["MIT"]
  s.summary = "Library for string similarities."
  s.description = "Provides string similarity functions like levenshtein distance or dice's coefficient as native extensions."
  s.rubygems_version = ">= 1.3"
  s.required_ruby_version = ">= 1.9.3"
  s.platform    = Gem::Platform::RUBY
  s.extensions = ['ext/extconf.rb']

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.require_paths = ["lib"]

  s.add_dependency 'ffi', '~> 1.9'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'rspec', '~> 3.3'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
end
