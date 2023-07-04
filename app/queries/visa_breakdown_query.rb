class VisaBreakdownQuery
  def initialize(relation = Application.all)
    @relation = relation.submitted
  end

  def call
    @relation.group(:visa_type).order("count_id DESC").count(:id)
  end
end
