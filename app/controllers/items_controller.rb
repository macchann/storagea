class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def search
  end

  def result
    brand = params.require(:brand_id).permit(:brand_id)
    types = params.require(:type_id).permit(:type_id)
    style = params.require(:style_id).permit(:style_id)
    material = params.require(:material_id).permit(:material_id)
    @items = Item.all
    @items = @items.where(brand) unless brand[:brand_id].empty?
    @items = @items.where(types) unless types[:type_id].empty?
    @items = @items.where(style) unless style[:style_id].empty?
    @items = @items.where(material) unless material[:material_id].empty?
    @items = @items.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

end