# frozen_string_literal: true

module Applicants
  class PersonalDetail
    include ActiveModel::Model
    include DateHelpers
    attr_accessor :given_name, :family_name, :email_address, :phone_number,
                  :day, :month, :year, :sex, :passport_number, :nationality

    # TODO: Check whether we should be allowing an option of "Prefer not to say"
    SEX_OPTIONS = %w[female male other].freeze

    validates :given_name, presence: true
    validates :family_name, presence: true
    validates :email_address, presence: true
    validates :phone_number, presence: true
    validates :date_of_birth, presence: true
    validates :sex, presence: true, inclusion: { in: SEX_OPTIONS }
    validates :passport_number, presence: true
    validates :nationality, presence: true, inclusion: { in: NATIONALITIES }

    def date_of_birth
      date_from_hash
    end
  end
end
