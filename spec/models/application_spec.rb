# == Schema Information
#
# Table name: applications
#
#  id                :bigint           not null, primary key
#  application_date  :date
#  application_route :string
#  date_of_entry     :date
#  start_date        :date
#  subject           :string
#  urn               :string
#  visa_type         :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  applicant_id      :bigint
#
# Foreign Keys
#
#  fk_rails_...  (applicant_id => applicants.id)
#
require "rails_helper"

RSpec.describe Application do
  describe "validations" do
    context "when the application has been submitted" do
      subject(:application) { build(:teacher_application, :submitted) }

      it { expect(application).to validate_presence_of(:application_date) }
      it { expect(application).to validate_presence_of(:application_route) }
      it { expect(application).to validate_presence_of(:date_of_entry) }
      it { expect(application).to validate_presence_of(:start_date) }
      it { expect(application).to validate_presence_of(:subject) }
      it { expect(application).to validate_presence_of(:visa_type) }
      it { expect(application).to validate_presence_of(:applicant) }
    end

    context "when the application has not been submitted" do
      it "is valid" do
        expect(described_class.new).to be_valid
      end
    end
  end

  describe "scopes" do
    describe ".submitted" do
      it "returns applications with a URN" do
        create_list(:application, 2, :submitted)
        create(:application, :not_submitted)

        expect(described_class.submitted.count).to eq 2
      end

      it "does not return applications without a URN" do
        create(:application, :not_submitted)

        expect(described_class.submitted.count).to eq 0
      end
    end
  end

  describe "#urn" do
    it "is blank before creation" do
      application = described_class.new

      expect(application.urn).to be_blank
    end
  end

  describe "#assign_urn!" do
    it "matches the required format for a teacher" do
      application = create(:teacher_application)
      application.assign_urn!

      expect(application.reload.urn).to match(/^IRPTE[A-Z0-9]{5}$/)
    end

    it "matches the required format for a trainee" do
      application = create(:salaried_trainee_application)
      application.assign_urn!

      expect(application.reload.urn).to match(/^IRPST[A-Z0-9]{5}$/)
    end
  end
end
