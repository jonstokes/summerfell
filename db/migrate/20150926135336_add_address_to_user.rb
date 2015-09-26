class AddAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name,     :string
    add_column :users, :last_name,      :string
    add_column :users, :phone,          :string
    add_column :users, :address_line_1, :string
    add_column :users, :address_line_2, :string
    add_column :users, :city,           :string
    add_column :users, :state,          :string
    add_column :users, :zip,            :string
  end
end
