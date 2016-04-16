json.array!(@admin_inventory_items) do |admin_inventory_item|
  json.extract! admin_inventory_item, :id
  json.url admin_inventory_item_url(admin_inventory_item, format: :json)
end
