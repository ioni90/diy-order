class RenameDeliveryTimeColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :delivery_time, :delivery_time_id
  end
end
