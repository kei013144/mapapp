require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録' do
      it "内容に問題ない場合" do
        expect(@user).to be_valid
      end
      it 'emailが255文字以下のユーザーが作成可能' do
        @user.email = 'a' * 245 + '@sample.jp'
        expect(@user).to be_valid
      end
      it 'emailは全て小文字で保存される' do
        @user.email = 'SAMPLE@SAMPLE.JP'
        @user.save!
        expect(@user.reload.email).to eq 'sample@sample.jp'
      end
    end
  end
end
