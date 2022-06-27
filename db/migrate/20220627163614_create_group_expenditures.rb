class CreateGroupExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_table :group_expenditures do |t|
      t.references :group, null: false, foreign_key: true
      t.references :expenditure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
