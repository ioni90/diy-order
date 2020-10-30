class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :type
  belongs_to_active_hash :delivery_time
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :story
    validates :size
    validates :price, numericality: { only_integer: true,
                                      greater_than: 299, less_than: 300001 }
  end

  with_options numericality: { other_than: 1 } do
    validates :type_id
    validates :delivery_time_id
  end
end
