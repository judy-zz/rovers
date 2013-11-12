# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rovers/version'

Gem::Specification.new do |spec|
  spec.name          = "rovers"
  spec.version       = Rovers::VERSION
  spec.authors       = ["Clinton Judy"]
  spec.email         = ["clinton@j-udy.com"]
  spec.summary       = "A martian-rover-themed turtle simulator."
  spec.homepage      = "http://judy.github.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3.5"
  spec.add_development_dependency "rake"
end
