class AddFavoritesCountToItems < ActiveRecord::Migration
  def change
    add_column :items, :favorites_count, :integer
  end
end
