# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'colored_logger/version'

Gem::Specification.new do |spec|
  spec.name          = "colored_logger"
  spec.version       = ColoredLogger::VERSION
  spec.authors       = ["Sushma Satish"]
  spec.email         = ["sushmasatish@gmail.com"]

  spec.summary       = %q{Provides a handy tool to colorize logs.}
  spec.description   = %q{Using colored logger, now all your logs are colored based on their severity.}
  spec.homepage      = "https://github.com/sushmasatish/colored_logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "rspec"
end
