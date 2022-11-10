if @error_object.blank?
  json.status true
  json.id @address.id
  json.user_id @address.user_id
  json.full_name @address.full_name
  json.province @address.province
  json.city @address.city
  json.detailed_address @address.detailed_address
  json.phone_number @address.phone_number
  json.is_billing @address.is_billing
  json.is_default @address.is_default
else
  json.status false
  json.error_object @error_object
end