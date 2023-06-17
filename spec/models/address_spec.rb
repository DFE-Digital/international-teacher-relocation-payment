# frozen_string_literal: true

require "rails_helper"

describe Address do
  it { is_expected.to validate_presence_of(:address_line_1) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:postcode) }
end
