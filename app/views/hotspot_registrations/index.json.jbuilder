json.array!(@hotspot_registrations) do |hotspot_registration|
  json.extract! hotspot_registration, :id
  json.url hotspot_registration_url(hotspot_registration, format: :json)
end
