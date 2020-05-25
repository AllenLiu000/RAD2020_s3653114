class CreateActives < ActiveRecord::Migration[5.2]
  def change
    create_table :actives do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :actives, [:user_id, :created_at]
  end
end
