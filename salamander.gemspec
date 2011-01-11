# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'salamander/version'

Gem::Specification.new do |s|
  s.name = 'salamander'
  s.version = Salamander::VERSION
  s.license = 'MIT'
  s.author = 'Jonathan Castello'
  s.email = 'jonathan@jonathan.com'
  
  s.summary = 'An easy-to-use turtle graphics DSL'
  s.description = 'An easy-to-use turtle graphics DSL'
  s.required_ruby_version = '~> 1.9.0'
  
  s.files = Dir['lib/**/*'] + Dir['bin/**/*']
  s.executables = 'salamander'
  
  s.add_development_dependency 'bundler', '~> 1.0.7'
  s.add_dependency 'ruby-sdl-ffi', '~> 0.3'
end
