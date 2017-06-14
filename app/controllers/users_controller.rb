class UsersController < ApplicationController
  def show
    @items = current_user.items.order("rand()")
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :introduction, :avater)
  end

end