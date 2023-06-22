class Kpis
  def initialize
    @applications = Applicant.all
  end

  def total_applications
    @applications.count
  end

  def route_breakdown
    RouteBreakdownQuery.new.call
  end
end
