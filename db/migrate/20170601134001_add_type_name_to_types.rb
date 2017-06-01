class AddTypeNameToTypes < ActiveRecord::Migration
  def change
            add_column :types, :type_name, :string
  end
end
