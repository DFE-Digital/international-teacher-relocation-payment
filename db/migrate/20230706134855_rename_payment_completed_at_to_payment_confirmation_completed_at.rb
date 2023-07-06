class RenamePaymentCompletedAtToPaymentConfirmationCompletedAt < ActiveRecord::Migration[7.0]
  def change
    rename_column(:application_progresses, :payment_completed_at, :payment_confirmation_completed_at)
  end
end
