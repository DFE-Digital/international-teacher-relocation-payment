require "rails_helper"

RSpec.describe "Healthchecks" do
  it "default request responds successfully when the rails server is up" do
    get "/healthcheck"

    expect(response).to have_http_status(:ok)
  end

  it "database checkpoint responds successfully when database is up" do
    get "/healthcheck/database"

    expect(response).to have_http_status(:ok)
  end
end
