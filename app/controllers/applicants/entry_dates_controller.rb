# frozen_string_literal: true

module Applicants
  class EntryDatesController < ApplicationController
    def new
      @entry_date = EntryDate.new(entry_date: current_application.date_of_entry)
    end

    def create
      @entry_date = EntryDate.new(entry_date_params)

      if @entry_date.valid?
        if eligible?
          current_application.update!(date_of_entry: @entry_date.entry_date)

          redirect_to(new_applicants_personal_detail_path)
        else
          redirect_to(ineligible_path)
        end
      else
        render(:new)
      end
    end

  private

    def eligible?
      Policies::EntryDate.eligible?(
        @entry_date.entry_date,
        current_application.start_date,
      )
    end

    def entry_date_params
      params.require(:applicants_entry_date).permit(
        *DATE_CONVERSION.keys,
      ).transform_keys { |key| DATE_CONVERSION[key] }
    end

    DATE_CONVERSION = {
      "entry_date(3i)" => "day",
      "entry_date(2i)" => "month",
      "entry_date(1i)" => "year",
    }.freeze
    private_constant :DATE_CONVERSION
  end
end
