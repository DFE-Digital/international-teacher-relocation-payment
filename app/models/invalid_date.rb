# frozen_string_literal: true

# The InvalidDate class is an ActiveModel model used for situations when
# the date provided is not valid. As per the current implementation this
# date is passed to the view so it is rendered as a normal date via the
# attribues: `day`, `month` and `year`.
#
# This same approach is used in the following places across Dfe:
#   - https://github.com/DFE-Digital/register-trainee-teachers
#   - https://github.com/DFE-Digital/early-careers-framework
#
# @attr_accessor [Integer] day The day component of the date.
# @attr_accessor [Integer] month The month component of the date.
# @attr_accessor [Integer] year The year component of the date.
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
