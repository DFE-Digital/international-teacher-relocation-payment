# frozen_string_literal: true

InvalidDate = Struct.new(:day, :month, :year, keyword_init: true) do
  def blank?
    members.any? { |date_field| public_send(date_field).blank? }
  end

  def present?
    false
  end
end
