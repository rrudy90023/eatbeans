json.array!(@plates) do |plate|
  json.extract! plate, :id, :description, :recipe
  json.url plate_url(plate, format: :json)
end
