class ShopreviewController < ApplicationController
  def create
    shop = Shop.find(params['shop_id'])
    @shop_review = ShopReview.new(user: current_user, shop: shop, comment: params['comment'])
    if @shop_review.save
      redirect_to shop_path(shop), notice: 'レビューを投稿しました'
    else
      redirect_to root_path
    end
  end

  def destroy
    @shop_review = current_user.shop_reviews.find(params[:id])

    if @shop_review.destroy
      redirect_to shop_path(@shop_review.shop_id), notice: 'レビューを削除しました'
    else
      redirect_to shop_path(@shop_review.shop_id), alert: 'レビュー削除に失敗しました'
    end
  end
end
