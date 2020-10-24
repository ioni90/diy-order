class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.text :story, null: false
      t.integer :type, null: false
      t.integer :price, null: false
      t.string :size, null: false
      t.text :material
      t.text :detail
      t.integer :delivery_time, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
