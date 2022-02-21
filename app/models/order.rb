class Order < ApplicationRecord
  has_many :orders_details, dependent: :destroy
  belongs_to :customer

  # belongs_to :follower, class_name: "User"
  # belongs_to :followed, class_name: "User"

  enum payment_method: { credit_card: 0, transfer: 1 }
end
