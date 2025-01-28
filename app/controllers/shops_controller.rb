class ShopsController < ApplicationController
  before_action :authenticate

  def show
    @shop = Shop.find(params['id'])
  end

  private

  def authenticate
    return if logged_in?
    
    redirect_to root_path
  end
end
