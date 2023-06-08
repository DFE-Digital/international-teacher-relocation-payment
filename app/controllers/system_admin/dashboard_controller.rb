module SystemAdmin
  class DashboardController < AdminController
    def show
      @kpi_stats = KpiStats.new
    end
  end
end
