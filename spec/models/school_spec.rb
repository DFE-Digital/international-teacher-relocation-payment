# frozen_string_literal: true

require "rails_helper"

describe School do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:headteacher_name) }
end
