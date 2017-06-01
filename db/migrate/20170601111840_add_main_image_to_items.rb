class AddMainImageToItems < ActiveRecord::Migration
  def change
        add_column :items, :main_image, :text
  end
end
