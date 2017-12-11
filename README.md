# Cucumber::CalliopeImporter

This gem adds a 'calliope-import' formatter to cucumber that uploads cucumber json output to the calliope.pro platform.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cucumber-calliope_importer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cucumber-calliope_importer

## Usage

In order to use the calliope_import formatter we first have to require it in our env.rb file.

    require 'cucumber/calliope_import'

CalliopeImport uses environment variables of a test run to make an API call with the test results.
You can set those variables and call the formatter like this:

    $ cucumber API_KEY='API Key Here' PROFILE_ID='Profile_ID Here' -f calliope_import

The API url defaults to 'https://app.calliope.pro' this can be changed with the environment variable API_URL='API Url Here'

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mauricewijnia/cucumber-calliope_importer.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
