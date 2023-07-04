class DeleteApplicationRouteFromApplicant < ActiveRecord::Migration[7.0]
  def change
    remove_column :applicants, :application_route, :string
  end
end
