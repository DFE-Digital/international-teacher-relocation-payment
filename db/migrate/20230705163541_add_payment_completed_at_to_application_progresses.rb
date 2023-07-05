class AddPaymentCompletedAtToApplicationProgresses < ActiveRecord::Migration[7.0]
  def change
    add_column(:application_progresses, :payment_completed_at, :date)
  end
end
