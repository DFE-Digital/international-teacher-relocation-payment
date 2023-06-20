# frozen_string_literal: true

module Applicants
  class Subject
    include ActiveModel::Model
    attr_accessor :subject

    TEACHER_SUBJECTS = ["physics", "General/combined science", "languages", "other"].freeze
    TRAINEE_SUBJECTS = TEACHER_SUBJECTS - ["General/combined science"].freeze

    validates :subject, presence: true, inclusion: { in: TEACHER_SUBJECTS }

    def self.all(application_route)
      raise("Invalid route") unless %w[salaried_trainee teacher].include?(application_route)

      if application_route == "teacher"
        TEACHER_SUBJECTS
      else
        TRAINEE_SUBJECTS
      end
    end

    def eligible?
      subject != "other"
    end
  end
end
