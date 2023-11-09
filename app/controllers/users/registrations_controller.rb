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
    binding.pry
    customer_id = CreateCustomer.call(user_email: user_email).customer_id
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
    params.require(:user).permit(:password, :email)
  end
end
