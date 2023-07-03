class GenderBreakdownQuery
  def initialize(relation = Application.all)
    @relation = relation
  end

  def call
    @relation.group(:sex).order("count_id DESC").count(:id)
  end
end
