class RemoveColumnFromExpenditures < ActiveRecord::Migration[7.0]
  def change
    remove_reference :expenditures, :author, null: false, foreign_key: true
  end
end
