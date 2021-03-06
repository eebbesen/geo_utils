# GeoUtil

GeoUtil is a set of (mostly conversion) utilities for working with geo files across providers (like CartoDB, Socrata, etc.)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geo_util'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geo_util

## Usage

### Socrata to CartoDB
Some Socrata files have latitude and longitude tacked onto the end of a street address -- CartoDB doesn't extract it so GeoUtil will do it for you.

To remove latitude and longitude from the end of a street address and add columns LATITUDE and LONGITUDE to a dataset, run

    $ <exec steps here>

### Geocoding
Coming soon.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Testing

    $ bundle exec rake test

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/geo_util. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

