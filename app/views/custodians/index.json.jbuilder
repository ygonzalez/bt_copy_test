json.array!(@custodians) do |custodian|
  json.extract! custodian, :id, :name
  json.url custodian_url(custodian, format: :json)
end
