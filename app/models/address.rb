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
#  postcode         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint           not null
#
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true

  validates :address_line_1, presence: true
  validates :city, presence: true
  validates :postcode, presence: true
end
