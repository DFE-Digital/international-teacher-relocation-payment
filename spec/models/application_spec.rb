# == Schema Information
#
# Table name: applications
#
#  id               :bigint           not null, primary key
#  application_date :date             not null
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

      expect(application.urn).to match(/^IRPTE[A-Z0-9]{6}$/)
    end

    it "matches the required format for a trainee" do
      application = create(:salaried_trainee_application)

      expect(application.urn).to match(/^IRPLT[A-Z0-9]{6}$/)
    end
  end

  describe "#initialise_for_applicant!" do
    subject(:klass) { described_class }

    let(:applicant) { create(:applicant) }

    it "returns an application" do
      expect(klass.initialise_for_applicant!(applicant)).to be_a(described_class)
    end

    it "sets the applicant" do
      klass.initialise_for_applicant!(applicant)

      expect(applicant.application).to be_present
    end

    it "sets the application date" do
      application = klass.initialise_for_applicant!(applicant)

      expect(application.application_date).to eq(Date.current)
    end

    it "sets the urn" do
      application = klass.initialise_for_applicant!(applicant)

      expect(application.urn).to be_present
    end
  end
end
