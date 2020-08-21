class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :payment
  belongs_to_active_hash :days
  validates :name, :image, :content, :price, :category_id, :status_id, :prefecture_id, :payment_id, :days_id, presence: true
  validates :price, :numericality => { :greater_then => 300, :less_than => 9999999 }
  
  belongs_to :user
  has_one :order
  has_one_attached :image
end