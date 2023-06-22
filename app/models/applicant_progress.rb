# frozen_string_literal: true

# == Schema Information
#
# Table name: applicant_progresses
#
#  id                              :bigint           not null, primary key
#  home_office_checks_completed_at :date
#  initial_checks_completed_at     :date
#  school_checks_completed_at      :date
#  school_investigation_required   :boolean
#  visa_investigation_required     :boolean
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  applicant_id                    :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (applicant_id => applicants.id)
#
class ApplicantProgress < ApplicationRecord
  belongs_to :applicant
end
