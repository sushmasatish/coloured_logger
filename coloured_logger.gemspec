# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coloured_logger/version'

Gem::Specification.new do |spec|
  spec.name          = "coloured_logger"
  spec.version       = ColouredLogger::VERSION
  spec.authors       = ["Sushma Satish"]
  spec.email         = ["sushmasatish@gmail.com"]

  spec.summary       = %q{Provides a handy tool to colorize logs.}
  spec.description   = %q{Using coloured logger, now all your logs are coloured based on their severity.}
  spec.homepage      = "https://github.com/sushmasatish/coloured_logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", ">= 2.1.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec"
end
