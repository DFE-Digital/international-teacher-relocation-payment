class KpiService
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
    Applicant.nationality_breakdown.first(3)
  end

  def gender_breakdown
    Applicant.gender_breakdown
  end

  def age_breakdown
    Applicant.age_group_breakdown.sort_by { |k, _v| k }.to_h
  end

  def visa_breakdown
    Applicant.visa_breakdown
  end

  def route_breakdown
    Applicant.route_breakdown
  end
end
