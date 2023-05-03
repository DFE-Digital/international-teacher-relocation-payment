module Applicants
  class PersonalDetail
    include ActiveModel::Model
    attr_accessor :given_name, :family_name, :email_address

    validates :given_name, presence: true
    validates :family_name, presence: true
    validates :email_address, presence: true
  end
end