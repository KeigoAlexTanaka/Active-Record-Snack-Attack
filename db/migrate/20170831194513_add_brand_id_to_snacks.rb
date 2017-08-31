class AddBrandIdToSnacks < ActiveRecord::Migration[5.1]
  def change
    add_column :snacks, :brand_id, :integer
    add_index :snacks, :brand_id
  end
end
