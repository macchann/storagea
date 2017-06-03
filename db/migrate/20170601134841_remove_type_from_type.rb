class RemoveTypeFromType < ActiveRecord::Migration
  def change
    remove_column :types, :type, :string
  end
end
