class TimeToInitialChecksQuery
  def initialize(relation = ApplicationProgress.all)
    @relation = relation
  end

  def call
    applications_list = @relation.where.not(created_at: nil).where.not(initial_checks_completed_at: nil)

    average_time = applications_list.average("initial_checks_completed_at::date - created_at::date")

    average_time&.to_i&.round&.days
  end
end
