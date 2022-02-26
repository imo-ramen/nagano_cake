class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orders_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :item_image
  validates :name, :introduction, :price, presence: :true

  def  add_tax_price
  (self.price * 1.10).round
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def self.search_for(content)
      Item.where('name LIKE ?', '%' + content + '%')
  end
end
