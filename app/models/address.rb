class Address < ApplicationRecord
  belongs_to :customer
  #belongs_toはvalidationも含む　customer_idがないと保存できない含む

  validates :postal_code,:address,:name, presence: true
end
