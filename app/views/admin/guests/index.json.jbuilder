json.array!(@admin_guests) do |admin_guest|
  json.extract! admin_guest, :id
  json.url admin_guest_url(admin_guest, format: :json)
end
