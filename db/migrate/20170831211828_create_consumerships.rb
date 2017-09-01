class CreateConsumerships < ActiveRecord::Migration[5.1]
  def change
    create_table :consumerships do |t|
      t.integer :snack_id
      t.integer :consumer_id

      t.timestamps
    end

    add_index :consumerships, :snack_id
    add_index :consumerships, :consumer_id
  end
end
