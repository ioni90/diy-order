class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :closure, optional: true
  attr_accessor :token

  with_options presence: true do
    validates :name
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :location
    validates :phone, format: {with: /\d{11}/}
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0 }

end
