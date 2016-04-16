json.array!(@admin_hotspot_registrations) do |admin_hotspot_registration|
  json.extract! admin_hotspot_registration, :id
  json.url admin_hotspot_registration_url(admin_hotspot_registration, format: :json)
end
