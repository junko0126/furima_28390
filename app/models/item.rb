class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :payment
  belongs_to_active_hash :days
  validates :category, :status, :prefecture, :payment, :days, presence: true
  validates :category_id, :status_id, :prefecture_id, :payment_id, :days_id, numericality: { other_than: 1 }
  
  belongs_to :user
  has_one :order
  has_one_attached :image
end