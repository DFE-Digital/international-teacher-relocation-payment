# frozen_string_literal: true

module Applicants
  class ContractStartDate
    include ActiveModel::Model
    attr_accessor :day, :month, :year

    validate do |record|
      DayMonthYearDateValidator.new.validate(record)
    end

    validates :contract_start_date, presence: true

    def contract_start_date
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
  end
end
