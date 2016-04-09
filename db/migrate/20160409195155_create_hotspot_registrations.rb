class CreateHotspotRegistrations < ActiveRecord::Migration
  def change
    create_table :hotspot_registrations, id: :uuid do |t|
      t.macaddr :device_address, null: false
      t.macaddr :access_point_address, null: false
      t.uuid    :package_id, null: false
      t.string  :email
      t.boolean :terms, null: false
      t.string  :card_token

      t.timestamps null: false
    end

    add_index :hotspot_registrations, :device_address
  end
end
