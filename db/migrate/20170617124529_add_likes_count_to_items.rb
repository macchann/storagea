class AddLikesCountToItems < ActiveRecord::Migration
  def change
    add_column :items, :like_count, :integer
  end
end
