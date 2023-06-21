# frozen_string_literal: true

class HeartbeatController < ActionController::API
  def ping
    render(body: "PONG")
  end

  def healthcheck
    checks = {
      database: database_alive?,
    }

    status = checks.values.all? ? :ok : :service_unavailable

    render(status: status,
           json: {
             checks:,
           })
  end

  def sha
    render(json: { sha: ENV.fetch("COMMIT_SHA", nil) })
  end

private

  def database_alive?
    ActiveRecord::Base.connection.active?
  rescue PG::ConnectionBad
    false
  end
end
