# React::Rails::BenchmarkRenderer

This gem is a plugin to react-rails providing two things:

1. `React::ServerRendering::Concern::Instrumentation`
  - benchmarking instrumentation of the sort found in rails view rendering
  - can be included into any Renderer to add Benchmarking to it
2. `React::ServerRendering::BenchmarkRenderer`
  - a reference implementation of `React::ServerRendering::Concern::Instrumentation`

| Project                 |  React::Rails::BenchmarkRenderer    |
|------------------------ | ----------------- |
| gem name                |  react-rails-benchmark_renderer   |
| license                 |  MIT              |
| expert support          |  [![Get help on Codementor](https://cdn.codementor.io/badges/get_help_github.svg)](https://www.codementor.io/peterboling?utm_source=github&utm_medium=button&utm_term=peterboling&utm_campaign=github) |
| download rank               |  [![Total Downloads](https://img.shields.io/gem/rt/react-rails-benchmark_renderer.svg)](https://rubygems.org/gems/react-rails-benchmark_renderer) |
| version                 |  [![Gem Version](https://badge.fury.io/rb/react-rails-benchmark_renderer.png)](http://badge.fury.io/rb/react-rails-benchmark_renderer) |
| dependencies            |  [![Dependency Status](https://gemnasium.com/pboling/react-rails-benchmark_renderer.png)](https://gemnasium.com/pboling/react-rails-benchmark_renderer) |
| code quality            |  [![Code Climate](https://codeclimate.com/github/pboling/react-rails-benchmark_renderer.png)](https://codeclimate.com/github/pboling/react-rails-benchmark_renderer) |
| inline documenation     |  [![Inline docs](http://inch-ci.org/github/pboling/react-rails-benchmark_renderer.png)](http://inch-ci.org/github/pboling/react-rails-benchmark_renderer) |
| continuous integration  |  [![Build Status](https://secure.travis-ci.org/pboling/react-rails-benchmark_renderer.png?branch=master)](https://travis-ci.org/pboling/react-rails-benchmark_renderer) |
| test coverage           |  [![Coverage Status](https://coveralls.io/repos/pboling/react-rails-benchmark_renderer/badge.png)](https://coveralls.io/r/pboling/react-rails-benchmark_renderer) |
| homepage                |  [on Github.com][homepage] |
| documentation           |  [on Rdoc.info][documentation] |
| live chat               |  [![Join the chat at https://gitter.im/pboling/react-rails-benchmark_renderer](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/pboling/react-rails-benchmark_renderer?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) |
| Spread ~♡ⓛⓞⓥⓔ♡~      |  [🌏](https://about.me/peter.boling), [👼](https://angel.co/peter-boling), [:shipit:](http://coderwall.com/pboling), [![Tweet Peter](https://img.shields.io/twitter/follow/galtzo.svg?style=social&label=Follow)](http://twitter.com/galtzo), [🌹](https://nationalprogressiveparty.org) |

[semver]: http://semver.org/
[pvc]: http://docs.rubygems.org/read/chapter/16#page74
[railsbling]: http://www.railsbling.com
[peterboling]: http://www.peterboling.com
[coderbits]: https://coderbits.com/pboling
[coderwall]: http://coderwall.com/pboling
[documentation]: http://rdoc.info/github/pboling/react-rails-benchmark_renderer/frames
[homepage]: https://github.com/pboling/react-rails-benchmark_renderer


This idea started with [a PR I sent](https://github.com/reactjs/react-rails/pull/101/files) to [actual react-rails](https://github.com/reactjs/react-rails) before it hit 1.0 release.  I didn't have time to finish it then, and the structure of the react-rails codebase has changed considerably in latest master, so it is now 
quite easy to write a renderer as a plugin.  Rewriting it as a modular plugin also allowed me to
  * Not be beholden to the Apache 2 license on react-rails
  * Not be beholden to the Facebook CLA
  * Own the code myself!
  * Kudos to Facebook for making react-rails more modular so I could easily write this plugin!

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

    spec.add_dependency 'react-rails-benchmark_renderer', '~> 0.0'

## Contributing

1. Fork it ( https://github.com/[my-github-username]/react-rails-benchmark_renderer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Make sure to add tests!
6. Create a new Pull Request

## Contributors

See the [Network View](https://github.com/pboling/react-rails-benchmark_renderer/network)
