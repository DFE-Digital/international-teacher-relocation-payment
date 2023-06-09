class TimeToPaidQuery
  def initialize(relation = ApplicantProgress.all)
    @relation = relation
  end

  def call
    # Ensures that we're only considering those applicants with payment_completed_at
    paid_applicants = @relation.paid.where.not(payment_completed_at: nil)

    # Calculates average payment time
    paid_applicants.average("payment_completed_at - approval_completed_at").round.days
  end
end
