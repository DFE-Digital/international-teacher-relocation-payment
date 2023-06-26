module SystemAdmin
  class DashboardController < ApplicationController
    def show
      @kpis = Kpis.new
    end
  end
end
