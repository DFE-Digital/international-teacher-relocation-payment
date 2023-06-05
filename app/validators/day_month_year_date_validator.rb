# frozen_string_literal: true

class DayMonthYearDateValidator
  def validate(record, attribute = "day_month_year_date")
    @record = record

    record.errors.add(attribute, "Enter a valid date") unless valid?
  end

private

  def valid?
    day = @record.day
    month = @record.month
    year = @record.year

    return false unless day.present? && month.present? && year.present?

    Date.valid_date?(year, month, day)
  rescue ArgumentError
    false
  end
end
