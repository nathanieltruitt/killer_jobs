class ChangeCompanyIdToNullAgain < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :company_id
    add_column :users, :company_id, :bigint, null: true
  end
end
