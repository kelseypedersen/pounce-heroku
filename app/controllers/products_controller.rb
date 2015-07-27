class ProductsController < ApplicationController
  before_action :current_user

  # Show many items following a search
  def index
    raw_input = params[:search].to_s
    formatted_input = raw_input.gsub(" ", "+")

    @products = HTTParty.get("http://api.shopstyle.com/api/v2/products?pid=uid5001-30368749-95&fts='#{formatted_input}'&offset=0&limit=20")["products"]
  end

  # Details about a particular product
  def show
     @product = HTTParty.get("http://api.shopstyle.com/api/v2/products/#{params[:id]}?pid=uid5001-30368749-95")
  end

end

