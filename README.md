# React::Rails::BenchmarkRenderer

This idea started with [a PR I sent](https://github.com/reactjs/react-rails/pull/101/files) to [actual react-rails](https://github.com/reactjs/react-rails) before it hit 1.0 release.  I didn't have time to finish it then, and the structure of the react-rails codebase has changed considerably in latest master, so it is now 
quite easy to write a renderer as a plugin.  Rewriting it as a modular plugin also allowed me to
  * Not be beholden to the Apache 2 license on react-rails
  * Not be beholden to the Facebook CLA
  * Own the code myself!
  * Kudos to Facebook for making react-rails more modular so I could easily write this plugin!

NOTE: This gem requires the unreleased master branch of react-rails.  As such this gem may require some finesse.

This gem is a plugin to react-rails providing two things:

1. `React::ServerRendering::Concern::Instrumentation`
  - benchmarking instrumentation of the sort found in rails view rendering
  - can be included into any Renderer to add Benchmarking to it
2. `React::ServerRendering::BenchmarkRenderer`
  - a reference implementation of `React::ServerRendering::Concern::Instrumentation`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'react-rails-benchmark_renderer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install react-rails-benchmark_renderer

## Usage

To simply use the reference implementation, just edit your application.rb with:

```
    config.react.server_renderer = React::ServerRendering::BenchmarkRenderer
```

To roll your own renderer:

Use `Concern::Implementation` to enhance any React ServerRendering Renderer with benchmarking.  

Usage is just like you can see in the reference implementation:

```ruby
require "react/server_rendering/concerns/instrumentation"
# Extends SprocketsRenderer for benchmarking in the Rails environment
# - benchmarks rendering in the same manner as Rails view rendering is benchmarked by Rails
module React
  module ServerRendering
    class BenchmarkRenderer < SprocketsRenderer
      include Concerns::Instrumentation
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Maintenance

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0](http://semver.org/).
Violations of this scheme should be reported as bugs. Specifically,
if a minor or patch version is released that breaks backward
compatibility, a new version should be immediately released that
restores compatibility. Breaking changes to the public API will
only be introduced with new major versions.

As a result of this policy, you can (and should) specify a
dependency on this gem using the [Pessimistic Version Constraint](http://docs.rubygems.org/read/chapter/16#page74) with two digits of precision.

For example:

    spec.add_dependency 'destination_errors', '~> 0.0'

## Contributing

1. Fork it ( https://github.com/[my-github-username]/react-rails-benchmark_renderer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Make sure to add tests!
6. Create a new Pull Request

## Contributors

See the [Network View](https://github.com/pboling/react-rails-benchmark_renderer/network)
