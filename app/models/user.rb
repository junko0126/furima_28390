class User < ApplicationRecord
  has_many :items
  has_many :orders

  # "正規表現"
  @limit1 = /\A[ぁ-んァ-ン一-龥]/
  limit2 = /\A[ァ-ヶー－]+\z/
  limit3 = /\A[a-z0-9]+\z/i
  limit4 = /\A[a-z\d{6,20}[@]{3,20}\z]/i
  limit5 = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i

  with_options presence: true do
    validates :first_name, :family_name, format: { with: @limit1, message: 'is invalid. Input full-width characters.' }
    validates :first_name_kana, :family_name_kana, format: { with: limit2, message: 'is invalid. Input full-width katakana characters.' }
    validates :nickname, format: { with: limit3, message: 'is invalid. Input half-width characters.' }
    validates :email, format: { with: limit4, message: 'is invalid.' }
    validates :password, format: { with: limit5, message: 'is invalid.' }
    validates :birthday
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
end
