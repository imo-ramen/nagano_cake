class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orders_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :item_image

  def get_item_image
    (item_image.attached?) ? item_image : 'no_image.jpg'
  end

  def  add_tax_price
  (self.price * 1.10).round
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
