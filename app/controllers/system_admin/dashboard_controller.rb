module SystemAdmin
  class DashboardController < ApplicationController
    def show
      @kpi_service = KpiService.new
    end
  end
end
