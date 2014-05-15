# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'psd2csv/version'

Gem::Specification.new do |spec|
  spec.name          = "psd2csv"
  spec.version       = Psd2csv::VERSION
  spec.authors       = ["Tessa"]
  spec.email         = ["tessathornton@gmail.com"]
  spec.description   = %q{Converts PSD text to csv}
  spec.summary       = %q{psd to <csv></csv>}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ["psd2csv"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "psd"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
