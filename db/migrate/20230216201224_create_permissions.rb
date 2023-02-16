class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.string :name, null: false
      t.string :scope, null: false

      t.timestamps
    end
  end
end
