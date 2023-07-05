class TimeToSchoolChecksQuery
  def initialize(relation = ApplicationProgress.all)
    @relation = relation
  end

  def call
    applications_list = @relation.where.not(home_office_checks_completed_at: nil).where.not(school_checks_completed_at: nil)

    durations = applications_list.map { |app| (app.school_checks_completed_at.to_date - app.home_office_checks_completed_at.to_date).to_i }

    min_days = "#{durations.min.abs} days" if durations.min
    max_days = "#{durations.max.abs} days" if durations.max
    average_days = (durations.sum / durations.size.to_f)&.round&.days if durations.size.positive?

    { min: min_days, max: max_days, average: average_days }
  end
end
