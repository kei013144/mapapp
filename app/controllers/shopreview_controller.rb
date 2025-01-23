class ShopreviewController < ApplicationController
  def create
    shop = Shop.find(params['shop_id'])
    @shop_review = ShopReview.new(user: current_user, shop: shop, comment: params['comment'])
    if @shop_review.save
      redirect_to map_path, notice: 'レビューを投稿しました'
    else
      redirect_to root_path
    end
  end

  def destroy
    @shop_review = ShopReview.find(params['id'])
    if @shop_review.user == current_user
      if @shop_review.destroy!
        redirect_to map_path, notice: 'レビューを削除しました'
      else
        redirect_to map_path, alert: 'レビュー削除に失敗しました'
      end
    else
      redirect_to map_path, alert: 'ユーザーが一致しません'
    end
  end
end
