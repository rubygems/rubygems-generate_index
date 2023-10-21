# rubygems-generate_index

rubygems-generate_index generates the index files for a `gem server` directory.

The generate_index command creates a set of indexes for serving gems
statically. The command expects a 'gems' directory under the path given to
the --directory option. The given directory will be the directory you serve
as the gem repository.

For `gem generate_index --directory /path/to/repo`, expose /path/to/repo via
your HTTP server configuration (not /path/to/repo/gems).

When done, it will generate a set of files like this:

```
  gems/*.gem                                   # .gem files you want to
                                               # index

  specs.<version>.gz                           # specs index
  latest_specs.<version>.gz                    # latest specs index
  prerelease_specs.<version>.gz                # prerelease specs index
  quick/Marshal.<version>/<gemname>.gemspec.rz # Marshal quick index file
```

The .rz extension files are compressed with the inflate algorithm.
The Marshal version number comes from ruby's Marshal::MAJOR_VERSION and
Marshal::MINOR_VERSION constants. It is used to ensure compatibility.

This gem is a replacement for the `gem generate_index` command that was removed in RubyGems 3.5.0.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubygems-generate_index'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rubygems-generate_index

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake test` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rubygems/rubygems-generate_index.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
