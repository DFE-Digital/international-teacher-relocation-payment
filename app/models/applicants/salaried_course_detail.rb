module Applicants
  class SalariedCourseDetail
    include ActiveModel::Model
    attr_accessor :eligible_course

    ELIGIBLE_COURSE_OPTIONS = %w[yes no]

    validates :eligible_course, presence: true, inclusion: { in: ELIGIBLE_COURSE_OPTIONS }

    def eligible?
      eligible_course == "yes"
    end
  end
end