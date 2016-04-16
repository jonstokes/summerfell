class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer

    User.update_all(role: 1)

    change_column :users, :role, :integer, null: false
  end
end
