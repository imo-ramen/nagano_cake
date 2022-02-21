class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # has_many :followings, through: :relationships, source: :followed
  # has_many :followers, through: :reverse_of_relationships, source: :follower


end
