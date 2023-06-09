class TimeToApprovalQuery
  def initialize(relation = ApplicantProgress.all)
    @relation = relation
  end

  def call
    # Ensures that we're only considering those applicants with approval_completed_at
    approved_applicants = @relation.approved.where.not(approval_completed_at: nil)

    # Calculates average approval time
    approved_applicants.average("approval_completed_at - created_at::date").to_i.round.days
  end
end
