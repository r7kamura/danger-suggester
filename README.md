# Danger::Suggester

[![CircleCI](https://circleci.com/gh/r7kamura/danger-suggester.svg?style=svg)](https://circleci.com/gh/r7kamura/workflows/danger-suggester)
[![Gem Version](https://badge.fury.io/rb/danger-suggester.svg)](https://rubygems.org/gems/danger-suggester)
[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/github/r7kamura/danger-suggester)

A Danger plug-in to suggest code changes through inline comments in pull requests.

Suggestions are calculated based on the results of `git diff`, so any code formatter like rubocop, prettier, go fmt, etc. can be used for this.
Note that there is a limitation that multi-line replacements cannot be suggested because GitHub's suggested changes™ doesn't support it.

## Requirements

- Ruby 2.2 or higher

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'danger-suggester'
```

And then execute:

```
bundle
```

Or install it yourself as:

```
gem install danger-suggester
```

## Usage

Add this line to your application's Dangerfile:

```ruby
suggester.suggest
```

And then execute `danger` after correcting code by your favorite code formatters.

See [.circleci/config.yml](/.circleci/config.yml) for more detailed example.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/r7kamura/danger-suggester.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
