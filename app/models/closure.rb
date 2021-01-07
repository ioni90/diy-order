class Closure < ApplicationRecord

  belongs_to :bid
  belongs_to :order
  has_one :address

  validates :reply, presence: true
end
