class AddApprovalAndPaymentDatesToApplicantProgress < ActiveRecord::Migration[7.0]
  def change
    add_column(:applicant_progresses, :approval_completed_at, :date)
    add_column(:applicant_progresses, :payment_completed_at, :date)
    add_column(:applicant_progresses, :rejection_completed_at, :date)
  end
end
