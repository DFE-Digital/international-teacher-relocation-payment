module Applicant
  class PersonalDetail
    include ActiveModel::Model
    attr_accessor :first_names, :last_names, :email

    validates :first_names, presence: true
    validates :last_names, presence: true
    validates :email, presence: true
  end
end