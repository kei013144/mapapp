require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  it "ログインページが表示されること" do
    get login_path
    expect(response).to have_http_status(200)
    expect(response.body).to include("ログイン")
  end
end
