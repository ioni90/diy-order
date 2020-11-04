class CreateClosures < ActiveRecord::Migration[6.0]
  def change
    create_table :closures do |t|
      t.references :order, foreign_key: true, null: false
      t.references :bid, foreign_key: true, null: false
      t.text :reply, null: false
      t.timestamps
    end
  end
end
