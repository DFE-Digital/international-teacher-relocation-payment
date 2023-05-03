module Applicants
  class EntryDate
    include ActiveModel::Model
    include DateHelpers
    attr_accessor :day, :month, :year

    validates :entry_date, presence: true

    def entry_date
      date_from_hash
    end
  end
end