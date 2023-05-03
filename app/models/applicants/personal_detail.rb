module Applicants
  class PersonalDetail
    include ActiveModel::Model
    attr_accessor :given_name, :family_name, :email_address, :phone_number,
                  :day, :month, :year, :sex, :passport_number

    SEX_OPTIONS = %w[female male other]

    validates :given_name, presence: true
    validates :family_name, presence: true
    validates :email_address, presence: true
    validates :phone_number, presence: true
    validates :date_of_birth, presence: true
    validates :sex, presence: true, inclusion: { in: SEX_OPTIONS }
    validates :passport_number, presence: true

    InvalidDate = Struct.new(:day, :month, :year, keyword_init: true) do
      def blank?
        members.all? { |date_field| public_send(date_field).blank? }
      end
    end

    def date_of_birth
      date_hash = { year:, month:, day: }
      date_args = date_hash.values.map(&:to_i)
      valid_date?(date_args) ? Date.new(*date_args) : InvalidDate.new(date_hash)
    end

    def valid_date?(date_args)
      Date.valid_date?(*date_args) && date_args.all?(&:positive?)
    end
  end
end