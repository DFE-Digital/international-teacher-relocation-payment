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
class Application < ApplicationRecord
  belongs_to :applicant
  has_one :application_progress, dependent: :destroy

  validates :application_date, presence: true

  before_create :generate_urn

  def self.initialise_for_applicant!(applicant)
    application = create!(
      applicant: applicant,
      application_date: Date.current.to_s,
      application_progress: ApplicationProgress.new,
    )

    template_id = ENV.fetch("GOVUK_NOTIFY_APPLICATION_SUBMITTED_TEMPLATE_ID")
    email_address = applicant.email_address
    application_id = application.urn

    GovukNotify::Client.send_email(
      template_id,
      email_address,
      application_id,
    )
  end

private

  def generate_urn
    route_type = applicant.application_route

    self.urn = Urn.generate(route_type)
  end
end
