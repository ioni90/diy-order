class RenameTypeColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :type, :type_id
  end
end
