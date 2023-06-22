class KpiStats
  def initialize
    @applications = Applicant.all
    @progresses = @applications.map(&:applicant_progress)
  end

  def total_applications
    @applications.count
  end
end
