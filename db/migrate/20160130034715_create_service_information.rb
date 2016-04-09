class CreateServiceInformation < ActiveRecord::Migration
  def change
    create_table :service_informations, id: :uuid do |t|
      t.uuid   :user_id, null: false
      t.string :phone, limit: 255
      t.string :address_company_name, limit: 255
      t.string :address_full_name, limit: 255, null: false
      t.string :address_street, limit: 255, null: false
      t.string :address_unit, limit: 255
      t.string :address_city, limit: 255, null: false
      t.string :address_state, limit: 255, null: false
      t.string :address_zip_code, limit: 255, null: false
      t.string :address_country, limit: 255, null: false
      t.timestamps null: false
    end

    add_index :service_informations, :user_id
  end
end
