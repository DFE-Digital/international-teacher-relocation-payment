# frozen_string_literal: true

class InvalidDate
  include ActiveModel::Model

  attr_accessor :day, :month, :year

  def blank?
    [day, month, year].any?(&:blank?)
  end

  def present?
    false
  end
end
