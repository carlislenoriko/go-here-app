json.id @user.id
json.first_name @user.first_name
json.last_name @user.last_name
json.email @user.email
json.password_digest @user.password_digest
json.maps @user.maps.each do |map|
  json.id map.id
  json.map_name map.map_name
  json.description map.description
  json.pins map.pins.each do |pin|
    json.map_id pin.map_id
    json.pin_id pin.id
    json.pin_name pin.pin_name
    json.latitude pin.latitude
    json.longitude pin.longitude
    json.description pin.description
    json.address pin.address
  end
end