class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: params[:item_id])
    @favorites = Favorite.where(item_id: params[:item_id])
    @item = Item.find_by(id: params[:item_id])
    binding.pry
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    favorite.destroy
    @favorite = Favorite.where(item_id: params[:item_id])
    @item = Item.find_by(id: params[:item_id])
    binding.pry
  end
end


