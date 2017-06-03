class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string  :brand
      t.text    :brand_url
      t.timestamps
    end
  end
end
