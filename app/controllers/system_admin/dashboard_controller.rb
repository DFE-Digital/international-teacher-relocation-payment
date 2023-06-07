module SystemAdmin
  class DashboardController < ApplicationController
    def kpis
      @kpi_service = KpiService.new
    end
  end
end
