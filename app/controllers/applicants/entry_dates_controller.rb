module Applicants
  class EntryDatesController < ApplicationController
    DATE_CONVERSION = {
      "entry_date(3i)" => "day",
      "entry_date(2i)" => "month",
      "entry_date(1i)" => "year",
    }.freeze

    def new
      @entry_date = EntryDate.new
    end

    def create
      @entry_date = EntryDate.new(entry_date_params)

      if @entry_date.valid?
        session[:entry_date] = @entry_date.entry_date

        redirect_to new_applicants_personal_detail_path
      else
        render :new
      end
    end

    private

    def entry_date_params
      params.require(:applicants_entry_date).permit(
        *DATE_CONVERSION.keys,
      ).transform_keys { |key| DATE_CONVERSION[key] }
    end
  end
end