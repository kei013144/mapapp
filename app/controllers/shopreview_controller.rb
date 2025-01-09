class ShopreviewController < ApplicationController
  def create
    shop = Shop.find(params["shop_id"])
    @shop_review = ShopReview.new(user: current_user, shop: shop, comment: params["comment"])
    if @shop_review.save
      redirect_to map_path
    else
      redirect_to root_path
    end
  end
end
