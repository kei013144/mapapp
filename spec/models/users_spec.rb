require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

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
  it 'nameが必須であること' do
    @user.name = nil
    expect(@user).to be_invalid
    expect(@user.errors[:name]).to include("を入力してください")
  end
  it 'emailが必須であること' do
    @user.email = nil
    expect(@user).to be_invalid
    expect(@user.errors[:email]).to include("を入力してください")
  end
  it 'emailが正しい形式であること' do
    @user.email = 'invalid_email'
    expect(@user).to be_invalid
    expect(@user.errors[:email]).to include("は不正な値です")
  end
  it 'emailが一意であること' do
    FactoryBot.create(:user, email: 'test@example.com')
    @user.email = 'test@example.com'
    expect(@user).to be_invalid
    expect(@user.errors[:email]).to include("はすでに存在します")
  end
  it 'passwordが必須であること' do
    @user.password = nil
    expect(@user).to be_invalid
    expect(@user.errors[:password]).to include("を入力してください")
  end
  it 'passwordが6文字以上であること' do
    @user.password = '12345'
    expect(@user).to be_invalid
    expect(@user.errors[:password]).to include("は6文字以上で入力してください")
  end
end
