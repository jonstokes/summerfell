json.array!(@admin_deployments) do |admin_deployment|
  json.extract! admin_deployment, :id
  json.url admin_deployment_url(admin_deployment, format: :json)
end
