class KpiStats
  def initialize
    @applications = Applicant.all
  end

  def total_applications
    @applications.count
  end

  def total_approvals
    20
  end

  def total_rejections
    30
  end

  def time_to_payment
    3.days
  end

  def time_to_approval
    9.days
  end

  def nationality_breakdown
    NationalityBreakdownQuery.new.call.first(3)
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
