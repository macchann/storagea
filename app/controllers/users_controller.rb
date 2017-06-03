class UsersController < ApplicationController
  def show
    @items = current_user.items.order("rand()")
  end
end