class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :description, null: false
      t.string :title, null: false
      t.belongs_to :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
