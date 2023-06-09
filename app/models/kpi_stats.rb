class KpiStats
  def initialize
    @applications = Applicant.all
    @progresses = @applications.map(&:applicant_progress)
  end

  def total_applications
    @applications.count
  end

  def total_approvals
    @progresses.count(&:approved?)
  end

  def total_rejections
    @progresses.count(&:rejected?)
  end

  def total_paid
    @progresses.count(&:paid?)
  end

  def time_to_approval
    TimeToApprovalQuery.new.call
  end

  def time_to_payment
    TimeToPaidQuery.new.call
  end

  def time_to_rejection
    TimeToRejectionQuery.new.call
  end

  def nationality_breakdown
    NationalityBreakdownQuery.new.call.first(10)
  end

  def gender_breakdown
    GenderBreakdownQuery.new.call
  end

  def age_breakdown
    AgeGroupBreakdownQuery.new.call
  end

  def visa_breakdown
    VisaBreakdownQuery.new.call
  end

  def route_breakdown
    RouteBreakdownQuery.new.call
  end

  def subject_breakdown
    SubjectBreakdownQuery.new.call
  end
end
