class CreateAdminDeployments < ActiveRecord::Migration
  def change
    create_table :admin_deployments, id: :uuid do |t|
      t.string :name
      t.text :notes
      t.uuid :access_point_id
      t.uuid :station_id
      
      t.integer :status
      t.integer :role, null: false # link, backhaul, access_point

      t.timestamps null: false
    end
  end
end
