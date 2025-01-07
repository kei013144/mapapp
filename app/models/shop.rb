class Shop < ApplicationRecord
    has_many :shop_reviews, dependent: :destroy
end
