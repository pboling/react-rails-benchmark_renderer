# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'react/rails/benchmark_renderer/version'

Gem::Specification.new do |spec|
  spec.name          = "react-rails-benchmark_renderer"
  spec.version       = React::Rails::BenchmarkRenderer::VERSION
  spec.authors       = ["Peter Boling"]
  spec.email         = ["peter.boling@gmail.com"]

  spec.summary       = %q{Concern::Instrumentation Plugin for React::Rails Render Benchmarking with a reference implementation}
  spec.description   = %q{Concern::Instrumentation Plugin for React::Rails Render Benchmarking with a reference implementation}
  spec.homepage      = "https://github.com/pboling/react-rails-benchmark_renderer"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "tilt"
  spec.add_dependency "activesupport", "6.1.3.1"
  spec.add_dependency "react-rails", ">= 1.0"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec"
end
