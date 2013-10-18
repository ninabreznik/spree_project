class Product < ActiveRecord::Base

  validates :name,  presence: true
  VALID_PRICE_REGEX = /^\d+(([.,])\d+)?$/
  validates :price, presence: true, format: { with: VALID_PRICE_REGEX }
end
