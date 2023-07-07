# frozen_string_literal: true

module Applicants
  class PersonalDetail
    include ActiveModel::Model
    attr_accessor :given_name, :family_name, :email_address, :phone_number,
                  :day, :month, :year, :sex, :passport_number, :nationality, :address_line_1,
                  :address_line_2, :city, :postcode

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

    def self.load(applicant)
      new.tap do |model|
        model.given_name = applicant.given_name
        model.family_name = applicant.family_name
        model.email_address = applicant.email_address
        model.phone_number = applicant.phone_number
        model.day = applicant.date_of_birth.day
        model.month = applicant.date_of_birth.month
        model.year = applicant.date_of_birth.year
        model.sex = applicant.sex
        model.passport_number = applicant.passport_number
        model.nationality = applicant.nationality
        model.address_line_1 = applicant.address.address_line_1
        model.address_line_2 = applicant.address.address_line_2
        model.city = applicant.address.city
        model.postcode = applicant.address.postcode
      end
    end

    def save!(application:)
      Applicant.create!(
        application: application,
        given_name: given_name,
        family_name: family_name,
        email_address: email_address,
        phone_number: phone_number,
        date_of_birth: date_of_birth,
        sex: sex,
        passport_number: passport_number,
        nationality: nationality,
        address_attributes: {
          address_line_1:,
          address_line_2:,
          city:,
          postcode:,
        },
      )
    end

  private

    def date_of_birth_not_in_future
      return unless date_of_birth.present? && date_of_birth > Date.current

      errors.add(:date_of_birth, "cannot be in the future")
    end

    def age_less_than_maximum
      return unless date_of_birth.present? && (Date.current.year - date_of_birth.year) >= MAX_AGE

      errors.add(:date_of_birth)
    end
  end

  MAX_AGE = 80
  private_constant :MAX_AGE
end
