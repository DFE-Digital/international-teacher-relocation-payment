module SystemAdmin
  class DashboardController < AdminController
    def show
      @kpis = Kpis.new
    end
  end
end
