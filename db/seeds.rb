# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Shop.find_or_create_by!(name: '八重北食堂', latitude: 35.68249907992816, longitude: 139.76814256519458)
Shop.find_or_create_by!(name: 'スターバックス コーヒー ＪＲ東海 東京駅新幹線南ラチ内店', latitude: 35.68055780416288, longitude: 139.7676165793977)
Shop.find_or_create_by!(name: '浅草寿司場ひなと丸 東京駅中央店', latitude: 35.67963439321108, longitude: 139.7678295906337)
