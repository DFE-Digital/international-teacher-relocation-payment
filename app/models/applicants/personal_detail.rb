# frozen_string_literal: true

module Applicants
  class PersonalDetail
    include ActiveModel::Model
    include DateHelpers
    attr_accessor :given_name, :family_name, :email_address, :phone_number,
                  :day, :month, :year, :sex, :passport_number, :nationality, :address_line_1,
                  :address_line_2, :city, :county, :postcode

    SEX_OPTIONS = %w[female male].freeze

    validates :given_name, presence: true
    validates :family_name, presence: true
    validates :email_address, presence: true
    validates :phone_number, presence: true
    validates :phone_number, phone: { possible: true, types: %i[voip mobile] }
    validates :date_of_birth, presence: true
    validate :date_of_birth_not_in_future
    validate :age_less_than_maximum
    validates :sex, presence: true, inclusion: { in: SEX_OPTIONS }
    validates :passport_number, presence: true
    validates :nationality, presence: true, inclusion: { in: NATIONALITIES }
    validates :address_line_1, presence: true
    validates :city, presence: true
    validates :postcode, presence: true, postcode: true

    validate do |record|
      EmailFormatValidator.new(record).validate
      DayMonthYearDateValidator.new.validate(record, :date_of_birth)
    end

    def date_of_birth
      Date.new(year.to_i, month.to_i, day.to_i)
    rescue StandardError
      InvalidDate.new(day:, month:, year:)
    end

  private

    def date_of_birth_not_in_future
      return unless date_of_birth.present? && date_of_birth > Date.current

      errors.add(:date_of_birth, "cannot be in the future")
    end

    def age_less_than_maximum
      return unless date_of_birth.present? && (Date.current.year - date_of_birth.year) >= MAX_AGE

      errors.add(:date_of_birth, "age should be below #{MAX_AGE} years")
    end
  end

  MAX_AGE = 80
  private_constant :MAX_AGE

  InvalidDate = Struct.new(:day, :month, :year, keyword_init: true) do
    def blank?
      members.all? { |date_field| public_send(date_field).blank? }
    end

    def present?
      false
    end
  end
end
