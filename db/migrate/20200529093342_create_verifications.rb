class CreateVerifications < ActiveRecord::Migration[5.2]
  def change
    create_table :verifications do |t|
      t.text :cardtype
      t.text :cardnumber
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
