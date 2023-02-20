class ChangeCompanyIdToNull < ActiveRecord::Migration[7.0]
  def change
    change_table(:companies) do |t|
      t.column :company_id, :bigint, null: true
    end
  end
end
