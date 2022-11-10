if @error_object.blank?
  json.status true
  json.id @address.id
  json.user_id @address.user_id
  json.full_name @address.full_name
  json.province @address.province
  json.city @address.city
  json.detailed_address @address.detailed_address
  json.phone_number @address.phone_number
else
  json.status false
  json.error_object @error_object
end