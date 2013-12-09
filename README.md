# Jumble

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'jumble'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jumble

## Usage

Generate a sample config file:

    $ rails generate jumble:install

Then open `config/jumble.yml` and fill it out with your twitter credentials.

And you are ready to go!

    client = Jumble::REST::Client.new
    client.followers('gem')

You can use any of twitter (https://github.com/sferik/twitter) commands, we just proxy them.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
