class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip_code, null: false
      t.belongs_to :company, foreign_key: true
      t.boolean :primary_location

      t.timestamps
    end
  end
end
