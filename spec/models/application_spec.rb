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
    subject(:application) { described_class.new }

    it "is not blank on instantiation" do
      expect(application.urn).to be_present
    end

    it "starts with IRP" do
      expect(application.urn.value).to match(/\AIRP [ABCDEFHJKLMNPRSTUV23456789]{6}\z/)
    end
  end

  describe "#register_for_applicant!" do
    subject(:klass) { described_class }

    let(:applicant) { FactoryBot.create(:applicant) }

    it "returns an application" do
      expect(klass.register_for_applicant!(applicant)).to be_a(described_class)
    end

    it "sets the applicant" do
      klass.register_for_applicant!(applicant)

      expect(applicant.application).to be_present
    end

    it "sets the application date" do
      application = klass.register_for_applicant!(applicant)

      expect(application.application_date).to eq(Date.current)
    end

    it "sets the urn" do
      application = klass.register_for_applicant!(applicant)

      expect(application.urn).to be_present
    end
  end
end
