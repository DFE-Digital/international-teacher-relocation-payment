class RouteBreakdownQuery
  def initialize(relation = Applicant.all)
    @relation = relation
  end

  def call
    @relation.group(:application_route).order("count_id DESC").count(:id)
  end
end
