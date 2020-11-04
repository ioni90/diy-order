class AddOfferPriceToBid < ActiveRecord::Migration[6.0]
  def change
    add_column :bids, :offer_price, :integer
  end
end
