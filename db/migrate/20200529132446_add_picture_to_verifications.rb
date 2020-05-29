class AddPictureToVerifications < ActiveRecord::Migration[5.2]
  def change
    add_column :verifications, :picture, :string
  end
end
