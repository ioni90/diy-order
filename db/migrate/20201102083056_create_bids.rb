class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.references :order, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.boolean :price_ok, default: false, null: false
      t.boolean :size_ok, default: false, null: false
      t.boolean :material_ok, default: false, null: false
      t.boolean :detail_ok, default: false, null: false
      t.boolean :delivery_ok, default: false, null: false
      t.text :price_remark, null: false
      t.text :size_remark, null: false
      t.text :material_remark, null: false
      t.text :detail_remark, null: false
      t.text :delivery_time_remark, null: false
      t.text :message, null: false
      t.timestamps
    end
  end
end