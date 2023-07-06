class AddBankingApprovalCompletedAtToApplicationProgresses < ActiveRecord::Migration[7.0]
  def change
    add_column :application_progresses, :banking_approval_completed_at, :date
  end
end
