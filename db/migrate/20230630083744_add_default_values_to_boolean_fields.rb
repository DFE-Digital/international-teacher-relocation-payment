class AddDefaultValuesToBooleanFields < ActiveRecord::Migration[7.0]
  def up
    ApplicationProgress.where.not(visa_investigation_required: true)
                       .update(visa_investigation_required: false)
    change_column :application_progresses, :visa_investigation_required, :boolean, default: false, null: false

    ApplicationProgress.where.not(school_investigation_required: true)
                        .update(school_investigation_required: false)
    change_column :application_progresses, :school_investigation_required, :boolean, default: false, null: false
  end
end
