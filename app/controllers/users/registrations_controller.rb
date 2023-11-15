# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :json
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new

    super
  end

  # POST /resource/sign_in
  def create
    super

    return unless current_user

    customer = CreateCustomer.call(user_email: current_user.email)
    current_user.create_customer(customer_id: customer.id, identifier: customer.identifier) if customer.success?
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email)
  end
end
