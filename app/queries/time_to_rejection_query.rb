class TimeToRejectionQuery
  def initialize(relation = ApplicantProgress.all)
    @relation = relation
  end

  def call
    # Ensures that we're only considering those applicants with rejection_completed_at
    rejected_applicants = @relation.rejected.where.not(rejection_completed_at: nil)

    # Calculates average rejection time
    rejected_applicants.average("rejection_completed_at - created_at::date").to_i.round.days
  end
end
