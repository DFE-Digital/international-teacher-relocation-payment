# frozen_string_literal: true

# == Schema Information
#
# Table name: applicant_progresses
#
#  id                              :bigint           not null, primary key
#  approval_completed_at           :date
#  home_office_checks_completed_at :date
#  initial_checks_completed_at     :date
#  payment_completed_at            :date
#  rejection_completed_at          :date
#  school_checks_completed_at      :date
#  school_investigation_required   :boolean
#  status                          :integer
#  visa_investigation_required     :boolean
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  applicant_id                    :bigint           not null
#
# Indexes
#
#  index_applicant_progresses_on_applicant_id  (applicant_id)
#
# Foreign Keys
#
#  fk_rails_...  (applicant_id => applicants.id)
#
class ApplicantProgress < ApplicationRecord
  belongs_to :applicant
  enum status: { accepted: 0, approved: 1, paid: 2, rejected: 3 }
end
