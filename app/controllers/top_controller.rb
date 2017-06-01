class TopController < ApplicationController
  def index
    @items = Item.order('id DESC').limit(20)
    binding.pry
  end
end
