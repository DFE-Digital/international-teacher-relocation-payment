# frozen_string_literal: true

# == Schema Information
#
# Table name: schools
#
#  id               :bigint           not null, primary key
#  headteacher_name :string
#  name             :string
#  postcode         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "rails_helper"

describe School do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:headteacher_name) }
end
