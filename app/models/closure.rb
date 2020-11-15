class Closure < ApplicationRecord

  belongs_to :bid
  belongs_to :order

  validates :reply, presence: true
end
