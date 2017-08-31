class AddSnackTable < ActiveRecord::Migration[5.1]
  def change
    create_table :snacks do |t|
      t.string :name
      t.integer :calories
    end
  end
end
