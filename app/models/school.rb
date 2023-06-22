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
class School < ApplicationRecord
  # TODO: School has one applicant (and not many) as we don't have master data yet
  has_one :applicant, dependent: :nullify
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  validates :name, presence: true
  validates :headteacher_name, presence: true
end
