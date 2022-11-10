if @error_object.blank?
  json.status true
  json.address_id @address.id
else
  json.status false
  json.error_object @error_object
end