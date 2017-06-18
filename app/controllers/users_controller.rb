class UsersController < ApplicationController
  def show
    @items = current_user.items.order("rand()")
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  def favorite
  favorite = current_user.likes.order('updated_at DESC')
  favorite_ids = favorite.pluck(:item_id)
  @items = favorite_ids.map{ |id| Item.find(id) }
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :introduction, :avater)
  end

end