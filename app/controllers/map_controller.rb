class MapController < ApplicationController
  before_action :authenticate

  def index
    @shops = Shop.all
  end

  private

    def authenticate
      unless logged_in?
        redirect_to root_path
      end
    end
end
