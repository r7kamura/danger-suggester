# Danger::Suggester

[![CircleCI](https://circleci.com/gh/r7kamura/danger-suggester.svg?style=svg)](https://circleci.com/gh/r7kamura/workflows/danger-suggester)
[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/github/r7kamura/danger-suggester)

A Danger plug-in to suggest code changes through inline comments in pull requests.

## Requirements

- Ruby 2.3 or higher

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
# Dangerfile
suggester.suggest
```

And then execute `danger` after changing your code by any linter tools (e.g. `rubocop --auto-correct`).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/r7kamura/danger-suggester.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
