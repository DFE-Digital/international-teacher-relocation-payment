# frozen_string_literal: true

module Applicants
  class EntryDate
    include ActiveModel::Model
    attr_accessor :day, :month, :year

    validates :entry_date, presence: true

    validate do |record|
      DayMonthYearDateValidator.new.validate(record)
    end

    def entry_date
      return InvalidDate.new(day:, month:, year:) if year.blank?

      Date.new(year.to_i, month.to_i, day.to_i)
    rescue StandardError
      InvalidDate.new(day:, month:, year:)
    end

    InvalidDate = Struct.new(:day, :month, :year, keyword_init: true) do
      def blank?
        members.any? { |date_field| public_send(date_field).blank? }
      end

      def present?
        false
      end
    end

    # If the applicant is a teacher who entered the country more than three
    # months before their contract start date, they are not eligible.
    def eligible?(session)
      return true if session["application_route"] == "salaried_trainee"

      entry_date >= Date.parse(session["contract_start_date"]) - 3.months
    end
  end
end
