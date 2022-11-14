class Api::AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    @address.assign_attributes(user_id: session[:user]["user_id"])

    if @address.save
      address_card = render_to_string partial: "users/partials/user_address_card", locals: {address: @address}

      render json: {status: true, address_card: address_card}
    else
      @error_object = @address.errors.messages
    end
  end

  def destroy
    @address = Address.find_by(user_id: session[:user]["user_id"], id: params[:id])

    if @address.present?
      @error_object.errors = @address.errors unless @address.destroy
    else
      @error_object = {address: "Address not found"}
    end
  end

  def show
    @address = Address.find_by(user_id: session[:user]["user_id"], id: params[:id])

    @error_object = @address.errors.messages unless @address.present?
  end

  def update
    @address = Address.find_by(user_id: session[:user]["user_id"], id: params[:id])

    if @address.present?
      @address.assign_attributes(address_params)
      @address.assign_attributes(is_billing: address_params["is_billing"].present?)
      @address.assign_attributes(is_default: address_params["is_default"].present?)
      @error_object = @address.errors.messages unless @address.save!
    else
      @error_object = {address: "Address not found"}
    end
  end

  private
  def address_params
    params.require(:addresses).permit(:full_name, :phone_number, :province, :city, :detailed_address, :is_billing, :is_default)
  end
end
