class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :payment
  belongs_to_active_hash :days

  with_options presence: true do
    validates :name, :image, :content, :category_id, :status_id, :prefecture_id, :payment_id, :days_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid. Price must be ¥300~9,999,999.' }
  end

  belongs_to :user
  has_one :order, dependent: :destroy
  has_one_attached :image
end
