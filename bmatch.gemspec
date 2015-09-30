# encoding: utf-8
require File.expand_path('../lib/bmatch/version', __FILE__)

Gem::Specification.new do |s|
  s.name = "bmatch"
  s.version = Bmatch::VERSION
  s.authors = ["Udo Groebner"]
  s.homepage = "https://github.com/udl/bmatch"
  s.licenses = ["MIT"]
  s.summary = "Library for string similarities."
  s.description = "Provides string similarity functions like levenshtein distance or dice's coefficient as native extensions."
  s.rubygems_version = ">= 1.3"
  s.required_ruby_version = ">= 1.9.3"
  s.platform    = Gem::Platform::RUBY

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'

  s.add_dependency 'ffi'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec'
end
