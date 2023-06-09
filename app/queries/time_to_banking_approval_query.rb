class TimeToBankingApprovalQuery
  def initialize(relation = ApplicationProgress.all)
    @relation = relation
  end

  def call
    applications_list = @relation.where.not(school_checks_completed_at: nil).where.not(banking_approval_completed_at: nil)

    durations = applications_list.map { |app| (app.banking_approval_completed_at.to_date - app.school_checks_completed_at.to_date).to_i }

    min_days = "#{durations.min.abs} days" if durations.min
    max_days = "#{durations.max.abs} days" if durations.max
    average_days = durations.size.positive? ? "#{(durations.sum / durations.size.to_f).round.abs} days" : "0 days"

    { min: min_days, max: max_days, average: average_days }
  end
end
