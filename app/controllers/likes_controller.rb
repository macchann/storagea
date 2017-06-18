class LikesController < ApplicationController
    before_action :set_variables

  def like
    like = current_user.likes.new(item_id: @item.id)
    like.save
    @item = Item.find(@item.id)
  end

  def unlike
    like = current_user.likes.find_by(item_id: @item.id)
    like.destroy
        @item = Item.find(@item.id)
  end

  private

  def set_variables
    @item = Item.find(params[:item_id])
    @id_name = "#like-link-#{@item.id}"
    @id_heart = "#heart-#{@item.id}"
  end
end
