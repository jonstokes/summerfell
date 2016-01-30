class CreateAccessPoint < ActiveRecord::Migration
  def change
    create_table :access_points do |t|
      t.string :name
    end
  end
end
