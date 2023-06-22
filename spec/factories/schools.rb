# == Schema Information
#
# Table name: schools
#
#  id               :bigint           not null, primary key
#  headteacher_name :string
#  name             :string
#  postcode         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
FactoryBot.define do
  factory :school do
    postcode { "SE2 0BA" }
    headteacher_name { Faker::Name.name }
    name { Faker::Educator.secondary_school }
  end
end
