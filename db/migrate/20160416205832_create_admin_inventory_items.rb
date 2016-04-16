class CreateAdminInventoryItems < ActiveRecord::Migration
  def change
    create_table :admin_inventory_items do |t|

      t.timestamps null: false
    end
  end
end
