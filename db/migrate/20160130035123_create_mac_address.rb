class CreateMacAddress < ActiveRecord::Migration
  def change
    create_table :mac_addresses, id: :uuid do |t|
      t.uuid :addressable_id, null: false
      t.string :addressable_type, null: false
      t.macaddr :address, null: :false
      t.timestamps null: false
    end
  end
end
