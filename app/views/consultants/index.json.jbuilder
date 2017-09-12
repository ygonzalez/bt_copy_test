json.array!(@consultants) do |consultant|
  json.extract! consultant, :id, :name
  json.url consultant_url(consultant, format: :json)
end
