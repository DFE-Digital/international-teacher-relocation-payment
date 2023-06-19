# == Schema Information
#
# Table name: applications
#
#  id               :bigint           not null, primary key
#  application_date :string           not null
#  urn              :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  applicant_id     :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (applicant_id => applicants.id)
#
require "rails_helper"

RSpec.describe Application do
  it { is_expected.to validate_presence_of(:urn) }
  it { is_expected.to validate_presence_of(:application_date) }
end
