class SubjectBreakdownQuery
  def initialize(relation = Applicant.all)
    @relation = relation
  end

  def call
    @relation.group(:subject).order("count_id DESC").count(:id)
  end
end
