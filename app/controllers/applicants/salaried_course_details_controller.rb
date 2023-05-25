# frozen_string_literal: true

module Applicants
  class SalariedCourseDetailsController < ApplicationController
    before_action :check_trainee!

    def new
      @salaried_course_detail = SalariedCourseDetail.new
    end

    def create
      @salaried_course_detail = SalariedCourseDetail.new(salaried_course_detail_params)

      if @salaried_course_detail.valid?
        if @salaried_course_detail.eligible?
          session[:eligible_salaried_course] = @salaried_course_detail.eligible_course

          redirect_to new_applicants_subject_path
        else
          redirect_to ineligible_path
        end
      else
        render :new
      end
    end

    private

    def salaried_course_detail_params
      params.fetch(:applicants_salaried_course_detail, {}).permit(:eligible_course)
    end
  end
end