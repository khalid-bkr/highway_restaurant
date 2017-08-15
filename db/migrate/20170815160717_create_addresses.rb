class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :area
      t.string :road_name
      t.string :building_number
      t.string :apartment_number
      t.integer :floor
      t.string :landmark

      t.timestamps
    end
  end
end
