# frozen_string_literal: true

class AddApplicationRouteToApplicant < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :application_route, :string
  end
end
