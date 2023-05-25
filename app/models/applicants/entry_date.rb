# frozen_string_literal: true

module Applicants
  class EntryDate
    include ActiveModel::Model
    include DateHelpers
    attr_accessor :day, :month, :year

    validates :entry_date, presence: true

    def entry_date
      date_from_hash
    end

    # If the applicant is a teacher who entered the country more than three
    # months before their contract start date, they are not eligible.
    def eligible?(session)
      return true if session["application_route"] == "salaried_trainee"

      entry_date >= Date.parse(session["contract_start_date"]) - 3.months
    end
  end
end