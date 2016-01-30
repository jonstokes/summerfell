class CreateMacAddress < ActiveRecord::Migration
  def change
    create_table :mac_addresses, id: :uuid do |t|
      t.uuid :user_id
      t.macaddr :address, null: :false
      t.timestamps null: false  
    end
  end
end
