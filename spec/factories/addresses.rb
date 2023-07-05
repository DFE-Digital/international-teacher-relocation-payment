# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  address_line_1   :string
#  address_line_2   :string
#  addressable_type :string           not null
#  city             :string
#  postcode         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint           not null
#
FactoryBot.define do
  factory :address do
    address_line_1 { Faker::Address.street_address }
    address_line_2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    postcode { Faker::Address.postcode }
  end
end
