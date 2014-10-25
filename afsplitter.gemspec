# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'afsplitter/version'

Gem::Specification.new do |spec|
  spec.name          = "afsplitter"
  spec.version       = Afsplitter::VERSION
  spec.authors       = ["John Lane"]
  spec.email         = ["john@lane.uk.net"]
  spec.summary       = %q{AFsplitter - Anti-forensic Information Splitter}
  spec.description   = %q{Ruby FFI to AFsplitter from http://clemens.endorphin.org/AFsplitter.}
  spec.homepage      = ""
  spec.license       = "GPL"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "ffi", "~> 1.9.6"
end
