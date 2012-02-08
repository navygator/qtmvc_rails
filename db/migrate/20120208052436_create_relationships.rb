class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :group_id
      t.integer :employee_id

      t.timestamps
    end

    add_index :relationships, :group_id
    add_index :relationships, :employee_id
    add_index :relationships, [:group_id, :employee_id], :unique => true
  end
end
