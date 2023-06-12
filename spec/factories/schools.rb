FactoryBot.define do
  factory :school do
    postcode { "SE2 0BA" }
    headteacher_name { Faker::Name.name }
    name { Faker::Educator.secondary_school }
  end
end
