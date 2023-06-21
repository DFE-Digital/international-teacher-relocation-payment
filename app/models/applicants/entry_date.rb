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

    # If the applicant is a teacher who entered the country more than three
    # months before their contract start date, they are not eligible.
    def eligible?(session)
      entry_date >= Date.parse(session["contract_start_date"]) - 3.months
    end
  end
end
