# frozen_string_literal: true

# == Schema Information
#
# Table name: application_progresses
#
#  id                              :bigint           not null, primary key
#  home_office_checks_completed_at :date
#  initial_checks_completed_at     :date
#  payment_completed_at            :date
#  rejection_completed_at          :date
#  school_checks_completed_at      :date
#  school_investigation_required   :boolean
#  visa_investigation_required     :boolean
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  application_id                  :bigint
#
class ApplicationProgress < ApplicationRecord
  belongs_to :application
end
