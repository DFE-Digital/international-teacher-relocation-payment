class UpdateSubmittedApplications < ActiveRecord::Migration[7.0]
  def change
    Application.update(urn: nil, application_route: "teacher")
  end
end
