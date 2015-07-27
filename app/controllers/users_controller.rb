class UsersController < ApplicationController

  # Initial splash page with login/signup buttons
  def welcome
    @user
  end

  # Post route to create new user in database
  def create
    @user = User.new(name: params[:name], email: params[:email], phone_number: params[:phone_number], password: params[:password])
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  # Page user sees after login
  def show
    get_user
    @user_wants = Product.where(id: Want.where(user_id: @user.id).pluck(:product_id))
  end

end
