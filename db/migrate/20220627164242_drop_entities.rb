class DropEntities < ActiveRecord::Migration[7.0]
  def change
    drop_table :entities, force: :cascade
    drop_table :group_entities, force: :cascade
  end
end
