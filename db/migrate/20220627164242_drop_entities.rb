class DropEntities < ActiveRecord::Migration[7.0]
  def change
    drop_table :entities
    drop_table :group_entities
  end
end
