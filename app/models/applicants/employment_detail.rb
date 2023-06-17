# frozen_string_literal: true

module Applicants
  class EmploymentDetail
    include ActiveModel::Model
    attr_accessor :school_name,
                  :school_headteacher_name,
                  :school_address_line_1,
                  :school_address_line_2,
                  :school_city,
                  :school_county,
                  :school_postcode

    validates :school_name, presence: true
    validates :school_headteacher_name, presence: true
    validates :school_address_line_1, presence: true
    validates :school_city, presence: true
    validates :school_postcode, presence: true, postcode: true
  end
end
