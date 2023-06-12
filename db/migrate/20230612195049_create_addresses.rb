class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, null: false
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :county
      t.string :postcode

      t.timestamps
    end
  end
end
