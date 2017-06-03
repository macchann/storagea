class AddIdsToItems < ActiveRecord::Migration
  def change
    add_column :items, :material_id, :integer
    add_column :items, :style_id, :integer
  end
end
