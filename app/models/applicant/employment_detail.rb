module Applicant
  class EmploymentDetail
    include ActiveModel::Model
    attr_accessor :school_name, :school_address

    validates :school_name, presence: true
    validates :school_address, presence: true
  end
end