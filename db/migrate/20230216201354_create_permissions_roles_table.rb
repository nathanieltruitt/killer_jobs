class CreatePermissionsRolesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions_roles do |t|
      t.belongs_to :permission, foreign_key: true
      t.belongs_to :role, foreign_key: true
    end
  end
end
