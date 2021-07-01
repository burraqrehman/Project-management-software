class AddClientIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :client_id, :bigint
  end
end
