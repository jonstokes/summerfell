json.array!(@admin_packages) do |admin_package|
  json.extract! admin_package, :id
  json.url admin_package_url(admin_package, format: :json)
end
