class BrandsController < ApplicationController

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.create(create_params)
  end

   private
     def create_params
       params.require(:brand).permit(:brand, :brand_url).merge(user_id: current_user.id)
     end
end
