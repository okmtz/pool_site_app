# frozen_string_literal: true

require 'securerandom'

module Users
  class SessionsController < Devise::SessionsController
    before_action :authenticate_user!
    before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    def new
      @line_link_token = params[:line_link_token]
      super
    end

    # POST /resource/sign_in
    def create
      login_user = User.find_by(email: params[:user][:email])
      line_link_token = params[:user][:line_link_token]

      return redirect_to new_user_registration_path if login_user.nil?
      return super if line_link_token.blank?
      nonce = SecureRandom.base64(10)
      LineLinkNonce.create(user_id: login_user.id, nonce: nonce)
      redirect_to "https://access.line.me/dialog/bot/accountLink?linkToken=#{line_link_token}&nonce=#{nonce}"
    end

    # DELETE /resource/sign_out
    def destroy
      super
    end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:line_link_token])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end
  end
end
