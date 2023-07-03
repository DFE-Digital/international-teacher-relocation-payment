# == Schema Information
#
# Table name: applications
#
#  id               :bigint           not null, primary key
#  application_date :date             not null
#  date_of_entry    :date
#  sex              :string
#  subject          :string
#  urn              :string           not null
#  visa_type        :string
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
  it { is_expected.to validate_presence_of(:application_date) }

  describe "#urn" do
    it "is blank before creation" do
      application = build(:teacher_application)

      expect(application.urn).to be_blank
    end

    it "is present after creation" do
      application = create(:teacher_application)

      expect(application.urn).to be_present
    end

    it "matches the required format for a teacher" do
      application = create(:teacher_application)

      expect(application.urn).to match(/^IRPTE[A-Z0-9]{5}$/)
    end

    it "matches the required format for a trainee" do
      application = create(:salaried_trainee_application)

      expect(application.urn).to match(/^IRPST[A-Z0-9]{5}$/)
    end
  end
end
