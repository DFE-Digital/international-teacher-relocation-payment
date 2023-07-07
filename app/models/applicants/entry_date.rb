# frozen_string_literal: true

module Applicants
  class EntryDate
    include ActiveModel::Model
    attr_accessor :day, :month, :year

    validates :entry_date, presence: true

    validate do |record|
      DayMonthYearDateValidator.new.validate(record)
    end

    def entry_date=(entry_date)
      @day = entry_date&.day
      @month = entry_date&.month
      @year = entry_date&.year
    end

    def entry_date
      return InvalidDate.new(day:, month:, year:) if year.blank?

      Date.new(year.to_i, month.to_i, day.to_i)
    rescue StandardError
      InvalidDate.new(day:, month:, year:)
    end
  end
end
