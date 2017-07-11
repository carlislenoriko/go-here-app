json.id @category.id
json.pins @category.pins do |pin|
  json.map_id pin.map_id
  json.pin_id pin.id
  json.pin_name pin.pin_name
  json.latitude pin.latitude
  json.longitude pin.longitude
  json.description pin.description
  json.address pin.address
end
  