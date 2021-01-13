class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :type
  belongs_to_active_hash :delivery_time
  belongs_to :user
  has_many :bids
  has_one :closure

  with_options presence: true do
    validates :name
    validates :story
    validates :size
    validates :price, numericality: { only_integer: true,
                                      greater_than: 299, less_than: 300001 }
  end

    validates :type_id, numericality: { other_than: 1, message: "が選択されていません" }
    validates :delivery_time_id, numericality: { other_than: 1, message: "が選択されていません" }
end
