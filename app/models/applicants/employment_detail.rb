# frozen_string_literal: true

module Applicants
  class EmploymentDetail
    include ActiveModel::Model
    attr_accessor :school_name, :school_headteacher_name

    validates :school_name, presence: true
    validates :school_headteacher_name, presence: true
  end
end