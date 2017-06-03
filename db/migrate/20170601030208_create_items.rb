class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string  :name
      t.integer :type_id
      t.text    :description
      t.text    :memo
      t.timestamps
    end
  end
end
