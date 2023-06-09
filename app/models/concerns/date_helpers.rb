# frozen_string_literal: true

module DateHelpers
  def date_from_hash
    date_hash = { year:, month:, day: }
    date_args = date_hash.values.map(&:to_i)
    valid_date?(date_args) ? Date.new(*date_args) : InvalidDate.new(date_hash)
  end

  def valid_date?(date_args)
    Date.valid_date?(*date_args) && date_args.all?(&:positive?)
  end
end
