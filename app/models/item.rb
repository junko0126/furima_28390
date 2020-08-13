class Item < ApplicationRecord
  berongs_to :user
  has_one :order
end
