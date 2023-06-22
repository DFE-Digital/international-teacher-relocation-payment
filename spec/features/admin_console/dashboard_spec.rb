# frozen_string_literal: true

require "rails_helper"

describe "Dashboard" do
  it "shows the Total Applications widget" do
    visit(dashboard_path)
    expect(page).to have_content("Applications")
  end
end
