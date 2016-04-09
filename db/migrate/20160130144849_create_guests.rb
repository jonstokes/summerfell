class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests, id: :uuid do |t|
      t.macaddr :device_address, null: false
      t.macaddr :access_point_address, null: false
      t.uuid    :package_id, null: false
      t.string  :email

      t.timestamps null: false
    end

    add_index :guests, :device_address
  end
end
