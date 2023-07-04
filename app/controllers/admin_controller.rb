# frozen_string_literal: true

class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch("ADMIN_USERNAME"), password: ENV.fetch("ADMIN_PASSWORD")

  layout "admin"
end
