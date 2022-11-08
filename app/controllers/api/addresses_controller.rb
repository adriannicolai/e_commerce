class Api::AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    @address.assign_attributes(user_id: session[:user]["user_id"])

    @error_object = @address.errors.messages unless @address.save
  end

  private
  def address_params
    params.require(:addresses).permit(:full_name, :phone_number, :province, :city, :detailed_address, :is_billing, :is_default)
  end
end
