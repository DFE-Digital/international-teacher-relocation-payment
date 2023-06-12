class School < ApplicationRecord
  # TODO: School has one applicant (and not many) as we don't have master data yet
  has_one :applicant, dependent: :nullify
end
