# == Schema Information
#
# Table name: schools
#
#  id               :bigint           not null, primary key
#  headteacher_name :string
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
FactoryBot.define do
  factory :school do
    headteacher_name { Faker::Name.name }
    name { Faker::Educator.secondary_school }

    after(:create) do |school|
      create(:address, addressable: school)
    end
  end
end
