# frozen_string_literal: true

module ApplicationHelper
  def duration_in_words(duration)
    distance_of_time_in_words(Time.current, Time.current + duration)
  end
end
