class CreateShopReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :shop_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
