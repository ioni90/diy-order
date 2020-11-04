FactoryBot.define do
  factory :bid do

    price_ok { Faker::Boolean.boolean }
    size_ok { Faker::Boolean.boolean }
    material_ok { Faker::Boolean.boolean }
    detail_ok { Faker::Boolean.boolean }
    delivery_ok { Faker::Boolean.boolean }

    size_remark { Faker::Lorem.sentence(100) }
    material_remark { Faker::Lorem.sentence(100) }
    detail_remark { Faker::Lorem.sentence(100) }
    delivery_time_remark { Faker::Lorem.sentence(100) }
    price_remark { Faker::Lorem.sentence(100) }
    offer_price { Faker::Number.between(from: 300, to: 300000) }
    message { Faker::Lorem.sentence(100) }
    association :user
    association :order

  end
end
