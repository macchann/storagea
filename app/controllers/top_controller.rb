class TopController < ApplicationController
  def index
    @items = Item.order('id DESC').page(params[:page]).per(12)
  end
end
