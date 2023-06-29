class GenderBreakdownQuery
  def initialize(relation = Applicant.all)
    @relation = relation
  end

  def call
    @relation.group(:sex).order("count_id DESC").count(:id)
  end
end
