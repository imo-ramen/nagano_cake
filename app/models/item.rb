class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orders_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :item_image
  
  def get_item_imege
    item_image.attached? ? item_image : 'no_image.jpg'
  end
end
