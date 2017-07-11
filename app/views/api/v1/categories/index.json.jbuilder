json.array! @categories.each do |category|
  json.id category.id
  json.name category.category_name
  json.pins category.pins do |pin|
    json.id pin.id
    json.name pin.pin_name
    json.address pin.address
    json.latitude pin.latitude
    json.longitude pin.longitude
    json.description pin.description
  end
end