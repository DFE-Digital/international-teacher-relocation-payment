class RemovePostcodeFromSchools < ActiveRecord::Migration[7.0]
  def change
    remove_column(:schools, :postcode, :string)
  end
end
