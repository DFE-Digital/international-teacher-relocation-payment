# frozen_string_literal: true

module Applicants
  class SalariedCourseDetail
    include ActiveModel::Model
    attr_accessor :eligible_course

    # TODO: Consider saving this as a boolean but formatted Yes/No in UI and CSV
    ELIGIBLE_COURSE_OPTIONS = %w[yes no]

    validates :eligible_course, presence: true, inclusion: { in: ELIGIBLE_COURSE_OPTIONS }

    def eligible?
      eligible_course == "yes"
    end
  end
end