class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :prefecture_id, :postal_code, :city, :house_number, :building, :phone, :order_id

  limit1 = /\A[ぁ-んァ-ン一-龥]+\z/
  POSTAL_CODE = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  VALID_PHONE = /\A\d{10}$|^\d{11}\z/.freeze

  with_options presence: true do
    validates :prefecture_id, :house_number
    validates :city, format: { with: limit1, message: 'is invalid. Input full-width characters.' }
    validates :postal_code, format: { with: POSTAL_CODE, message: 'is invalid. Include hyphen(-)' }
    validates :phone, format: { with: VALID_PHONE, message: 'is invalid. Maxmam 11' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(prefecture_id: prefecture_id, postal_code: postal_code, city: city, house_number: house_number, building: building, phone: phone, order_id: order.id)
  end
end
