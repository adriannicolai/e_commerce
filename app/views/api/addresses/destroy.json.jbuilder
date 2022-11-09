if !@error_object.blank?
  json.status false
  json.error_object @error_object
else
  json.status true
  json.address_id @address.id
end