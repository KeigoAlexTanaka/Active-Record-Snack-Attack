class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :logo
      t.integer :brand_id

      t.timestamps
    end

    add_index :snacks, :brand_id
  end
end
