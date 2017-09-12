json.array!(@asset_classes) do |asset_class|
  json.extract! asset_class, :id, :name
  json.url asset_class_url(asset_class, format: :json)
end
