class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status
  validates :category, :status, presence: true
  validates :category_id, :status_id, numericality: { other_than: 1 }
  
  belongs_to :user
  has_one :order
  has_one_attached :image
end
