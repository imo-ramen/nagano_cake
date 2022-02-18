class Order < ApplicationRecord
  has_many :orders_details, dependent: :destory
  belongs_to :customer
end
