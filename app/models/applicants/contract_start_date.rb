# frozen_string_literal: true

module Applicants
  class ContractStartDate
    include ActiveModel::Model
    attr_accessor :day, :month, :year

    validate do |record|
      DayMonthYearDateValidator.new.validate(record)
    end

    validates :contract_start_date, presence: true

    def contract_start_date=(contract_start_date)
      @day = contract_start_date&.day
      @month = contract_start_date&.month
      @year = contract_start_date&.year
    end

    def contract_start_date
      Date.new(year.to_i, month.to_i, day.to_i)
    rescue StandardError
      InvalidDate.new(day:, month:, year:)
    end
  end
end
