class UsersController < ApplicationController
  def show
    @items = current_user.items.order("rand()").page(params[:page]).per(12)
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  def favorite
  favorite = current_user.likes
  favorite_ids = favorite.pluck(:item_id)
  @items = Item.where(id: favorite_ids).page(params[:page]).per(12).order("updated_at DESC")
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :introduction, :avater)
  end

end