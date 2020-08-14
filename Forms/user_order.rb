class UserOrder
  include ActiveModel::ActiveModel
  attr_accessor :first_name, :family_name, :first_name_kana, :family_name_kana, :nickname, :email, :password, :password_confirm, :birthday
end
