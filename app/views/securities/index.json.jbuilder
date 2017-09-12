json.array!(@securities) do |security|
  json.extract! security, :id, :name
  json.url security_url(security, format: :json)
end
