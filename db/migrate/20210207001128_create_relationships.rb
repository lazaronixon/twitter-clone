class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.bigint "user_id"
      t.bigint "target_id"

      t.timestamps
    end

    add_index :relationships, [:user_id, :target_id], unique: true
    add_index :relationships, [:target_id, :user_id], unique: true
  end
end
