# RequiredFieldStyle

    This gem will automatically add your configured css class to required field of standard FormBuilder label.
    If you do not configure it, then it will automatically add red asterisk in front of your required field.
    This gem only work for standard FormBuilder. If you use customise FormBuilder or you put your label manually,
    then this gem will not work in that particular form.

## Installation

Add this line to your application's Gemfile:

    gem 'required_field_style'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install required_field_style

## Usage

    To configure this gem :
        - create file config/initializers/required_field_style.rb
        - paste this code:
            RequiredFieldStyle.configure do |config|
              config.css_class_name = '<required_style>'
            end
        - you can change <required_style> with your own css class.
        - you must already has this css class in your assets.

    If you do not configure it, then the default style will take place.
    The default style is red asterisk after the label of required field.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/required_field_style/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
