FactoryBot.define do
  factory :address do
    address_line_1 { Faker::Address.street_address }
    address_line_2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    county { Faker::Address.state }
    postcode { Faker::Address.postcode }
  end
end
