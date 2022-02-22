class Order < ApplicationRecord
  has_many :orders_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum status: {
      入金待ち: 0,  
      入金確認: 1,  
      製作中: 2, 
      発送準備中: 3,  
      発送済み: 4  
   }
  
  def subtotal
    item.with_tax_price * amount
  end
  
  
end
