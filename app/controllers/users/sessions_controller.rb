# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  # GET /resource/sign_in
  # def new  
  # end

  # POST /resource/sign_in
  # def create
  #   user = User.find_by_email(user_params[:email])
  #   if user && user.valid_password?(user_params[:password])
  #     sign_in(user)
  #     redirect_to home_path
  #   else
  #     render "new"
  #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:email,:password)
  # end
end
