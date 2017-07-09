json.array! @users.each do |user|
  json.id user.id
  json.first_name user.first_name
  json.last_name user.last_name
  json.email user.email
  json.password_digest user.password_digest
  json.maps user.maps do |map|
    json.map_name map.map_name
    json.description map.description
    json.pins map.pins do |pin|
      json.pin_name pin.pin_name
      json.latitude pin.latitude
      json.longitude pin.longitude
    end
  end
end