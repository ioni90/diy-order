FactoryBot.define do
  factory :order do
    name { Faker::Name.initials }
    story { Faker::Lorem.sentence(500) }
    type_id { Faker::Number.between(from: 2, to: 18) }
    size { Faker::Lorem.sentence(200) }
    material { Faker::Lorem.sentence(200) }
    detail { Faker::Lorem.sentence(500) }
    delivery_time_id { Faker::Number.between(from: 2, to: 7) }
    price { Faker::Number.between(from: 300, to: 300000) }
    association :user
  end
end