class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :discount_by_quantity, hashy_array: {
    uuid: 'unique',
    quantity: HashValidator.multiple('required', 'numeric'),
    price: HashValidator.multiple('required', 'numeric'),
    active: HashValidator.multiple('required', 'boolean'),
  }
end
