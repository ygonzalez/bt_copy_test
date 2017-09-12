json.array!(@managers) do |manager|
  json.extract! manager, :id, :name
  json.url manager_url(manager, format: :json)
end
