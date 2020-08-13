class UsersController < ApplicationController
  def index
  end
  
  def new
  end

  def create
    user = User.create(user_parms)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :family_name, :first_name_kana, :family_name_kana, :nickname, :email, :password, :password_confirm, :birthday)
end
