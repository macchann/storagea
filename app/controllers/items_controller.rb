class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.order('updated_at DESC')
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
    @items = @items.where('name LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(12)
  end

  def resultm
    brand = params.require(:brand_id).permit(:brand_id)
    types = params.require(:type_id).permit(:type_id)
    style = params.require(:style_id).permit(:style_id)
    material = params.require(:material_id).permit(:material_id)
    @items = current_user.items
    @items = @items.where(brand) unless brand[:brand_id].empty?
    @items = @items.where(types) unless types[:type_id].empty?
    @items = @items.where(style) unless style[:style_id].empty?
    @items = @items.where(material) unless material[:material_id].empty?
    @items = @items.where('name LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(12)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(create_params)
  end

  def destroy
    @item = Item.find(params[:id])
      if @item.user_id == current_user.id
        @item.destroy
      end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
      if @item.user_id == current_user.id
        @item.update(update_params)
      end
  end

  private
    def create_params
      params.require(:item).permit(:name, :brand_id, :type_id, :style_id, :material_id, :image, :description, :memo).merge(user_id: current_user.id).merge(like_count: 0)
    end

    def update_params
      params.require(:item).permit(:name, :brand_id, :type_id, :style_id, :material_id, :image, :description, :memo).merge(user_id: current_user.id)
    end

end