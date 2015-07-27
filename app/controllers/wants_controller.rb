class WantsController < ApplicationController
   before_action :current_user

  # Post route to create a new want
  def create

    p params
    @product = Product.new(shopstyle_id: params[:shopstyle_id].to_i, title: params[:title], description: params[:description], current_price: params[:current_price].to_f, image_url: params[:image_url] )

    if @product.save
      @want = Want.new(user_id: @current_user.id, product_id: @product.id, max_price: params[:wants][:max_price].to_f, expiration: params[:wants][:expiration])
      if @want.save
        redirect_to user_wants_path(@current_user)
      end
    end
  end

  # Get route to view the want before editing
  def edit
    @want = Want.find(params[:want_id])
    @product = Product.where(id: @want.product_id)
  end

  # Updates the want in the database
  def update
    @want = Want.update(max_price: params[:max_price].to_f, expiration: params[:expiration])
    if @want.save
      redirect_to user_wants_path(@current_user)
    end
  end

  # Delete the want
  def destroy
    @want = Want.find(params[:want_id])
    @want.destroy
    redirect_to user_wants_path(@current_user)
  end

  # Display all wants for a particular user
  def index

    @fulfilled_wants = Product.where(id: Want.where(user_id: @current_user.id).where(fulfilled: true).pluck(:product_id))
    @unfulfilled_wants = Product.where(id: Want.where(user_id: @current_user.id).where(fulfilled: false).pluck(:product_id))
    p "*"*80
    p @fulfilled_wants
    p "*"*80
    p "*"*80
    p @unfulfilled_wants
    return @unfulfilled_wants
  end

end
