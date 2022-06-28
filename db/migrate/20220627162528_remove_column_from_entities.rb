# frozen_string_literal: true

class RemoveColumnFromEntities < ActiveRecord::Migration[7.0]
  def change
    remove_reference :entities, :group, null: false, foreign_key: true
  end
end
