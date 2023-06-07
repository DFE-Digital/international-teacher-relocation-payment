class NationalityBreakdownQuery
  def initialize(relation = Applicant.all)
    @relation = relation
  end

  def call
    @relation.group(:nationality).order("count_id DESC").count(:id)
  end
end
