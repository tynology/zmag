json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :address, :city, :state, :zip, :phone
  json.url organization_url(organization, format: :json)
end
