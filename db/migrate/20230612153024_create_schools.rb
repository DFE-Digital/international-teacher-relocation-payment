class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :postcode
      t.string :name
      t.string :headteacher_name

      t.timestamps
    end
  end
end
