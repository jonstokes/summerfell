class CreateAdminInventoryItems < ActiveRecord::Migration
  def change
    create_table :admin_inventory_items, id: :uuid do |t|
      t.uuid    :user_id

      t.string  :name, null: false
      t.macaddr :device_address
      t.inet    :ip
      t.integer :status, null: false # deployed, stocked, on_order
      t.integer :role, null: false   # AP, Station
      t.money   :cost, null: false
      t.text    :notes
      t.string  :order_id
      t.string  :order_date
      t.string  :vendor
      t.string  :ssid
      
      t.timestamps null: false
    end
  end
end
