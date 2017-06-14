class AddAvaterToUser < ActiveRecord::Migration
  def change
    add_column :users, :avater, :string
  end
end
