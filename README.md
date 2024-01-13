# AR Hashy Validator example

This is a simple example of gem usage: https://rubygems.org/gems/hashy_validator

You can open this project in devcontainer :)

# Usage

### Install the gem

´´´ruby
gem 'hashy_validator'
´´´

Create your model and controller, and use validates like:

´´´ruby
class Product < ActiveRecord::Base
    validates :name, presence: true
    validates :discount_by_quantity, hashy_array: {
        uuid: 'unique',
        quantity: HashValidator.multiple('required', 'numeric'),
        price: HashValidator.multiple('required', 'numeric'),
        active: HashValidator.multiple('required', 'boolean'),
    }
end
´´´

If you want test in your seed:

´´´ruby

Product.create!(name: 'IPhone', discount_by_quantity: JSON.generate(
    [
        {
            uuid: '1a2b3c4d5e6f7g8h9i0j',
            quantity: 3,
            price: 100,
            active: true
        }
    ]
))
´´´

if you duplicate the uuid, you will have an error like that:

´´´bash
/home/vscode/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activerecord-7.1.2/lib/active_record/validations.rb:84:in `raise_validation_error': Validation failed: Discount by quantity 'uuid' not unique (ActiveRecord::RecordInvalid)
´´´


More documentation in: https://github.com/flecto-io/hashy-validator