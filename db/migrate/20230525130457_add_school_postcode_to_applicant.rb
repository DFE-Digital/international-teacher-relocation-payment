# frozen_string_literal: true

class AddSchoolPostcodeToApplicant < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :school_postcode, :string
  end
end
