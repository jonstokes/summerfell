class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages, id: :uuid do |t|
      t.string  :name, null: false
      t.string  :charged_as, null: false
      t.money   :price_cents, null: false
      t.string  :currency, limit: 255, null: false
      t.text    :description, null: false
      t.integer :duration_minutes, null: false
      t.integer :limit_up
      t.integer :limit_down
      t.integer :limit_quota

      t.timestamps null: false
    end
  end
end
