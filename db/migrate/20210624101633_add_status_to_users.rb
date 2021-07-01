class AddStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :roles, :string, null: false, default: "member"
  end
end
