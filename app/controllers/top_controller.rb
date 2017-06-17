class TopController < ApplicationController
  def index
    @items = Item.order('id DESC').limit(20)
    @favorites = Favorite.where(user_id: current_user)
  end
end
