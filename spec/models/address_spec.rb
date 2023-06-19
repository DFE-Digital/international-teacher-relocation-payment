# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  address_line_1   :string
#  address_line_2   :string
#  addressable_type :string           not null
#  city             :string
#  county           :string
#  postcode         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint           not null
#
require "rails_helper"

describe Address do
  it { is_expected.to validate_presence_of(:address_line_1) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:postcode) }
end
