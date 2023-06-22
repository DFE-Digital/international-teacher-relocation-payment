module SystemAdmin
  class DashboardController < ApplicationController
    def show
      @kpi_stats = KpiStats.new
    end
  end
end
