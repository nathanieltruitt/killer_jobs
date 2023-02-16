class ChangeCompanyIdToNullable < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.change :company_id, :bigint, null: true
    end
  end
end
