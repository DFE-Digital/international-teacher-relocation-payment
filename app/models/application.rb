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
class Application < ApplicationRecord
  belongs_to :applicant, optional: true
  has_one :application_progress, dependent: :destroy

  with_options if: :submitted? do
    validates(:application_date, presence: true)
    validates(:application_route, presence: true)
    validates(:date_of_entry, presence: true)
    validates(:start_date, presence: true)
    validates(:subject, presence: true)
    validates(:visa_type, presence: true)
    validates(:urn, presence: true)
    validates(:applicant, presence: true)
  end

  def assign_urn!
    update!(urn: Urn.generate(application_route))
  end

  def submitted?
    urn.present?
  end
end
