class AddApplicaitonRouteToApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :applications, :application_route, :string
  end
end
