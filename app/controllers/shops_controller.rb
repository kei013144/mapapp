class ShopsController < ApplicationController
  before_action :authenticate

  def show
    @shop = Shop.find(params['id'])
    @shop_reviews = @shop.shop_reviews.order(created_at: :desc).page(params[:page])
  end

  private

  def authenticate
    return if logged_in?
    
    redirect_to root_path
  end
end
