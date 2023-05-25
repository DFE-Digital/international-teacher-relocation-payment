# frozen_string_literal: true

module Applicants
  class TeachingDetailsController < ApplicationController
    def new
      @teaching_detail = TeachingDetail.new
    end

    def create
      @teaching_detail = TeachingDetail.new(teaching_detail_params)

      if @teaching_detail.valid?
        if @teaching_detail.eligible?
          session[:fifty_percent] = @teaching_detail.fifty_percent

          redirect_to new_applicants_visa_path
        else
          redirect_to ineligible_path
        end
      else
        render :new
      end
    end

    private

    def teaching_detail_params
      params.fetch(:applicants_teaching_detail, {}).permit(:fifty_percent)
    end
  end
end