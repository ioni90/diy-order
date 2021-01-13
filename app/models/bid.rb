class Bid < ApplicationRecord

  belongs_to :order
  belongs_to :user
  has_one :closure

  with_options presence: true do
    validates :message
    validates :delivery_time_remark
    validates :size_remark
    validates :material_remark
    validates :detail_remark
    validates :price_remark
  end

  validates :offer_price, allow_blank: true, numericality: { only_integer: true, message:"に半角数字が使用されていません" }

end
