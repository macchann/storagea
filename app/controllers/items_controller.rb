class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def search
  end

  def result
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").where(create_params)
  end

  private
    def create_params
    params.require(:brand_id).permit(:brand_id)
    end
end