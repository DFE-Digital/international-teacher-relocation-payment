module Applicants
  class EmploymentDetail
    include ActiveModel::Model
    attr_accessor :school_name

    validates :school_name, presence: true
  end
end