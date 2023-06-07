class VisaBreakdownQuery
  def initialize(relation = Applicant.all)
    @relation = relation
  end

  def call
    @relation.group(:visa_type).order("count_id DESC").count(:id)
  end
end
