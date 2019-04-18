require 'json'
require 'jwt'
require 'auth'

class AuthController < ApplicationController
  before_action :authenticate, only: [:me]

  def login_with_google
    user = get_user_data_from_id_token()
    jwt = Auth.encode_email(user.email)
    render json: { user: user, token: jwt }
  end

  def me
    render json: @current_user
  end

  private

  def get_user_data_from_id_token
    validator = GoogleIDToken::Validator.new
    begin
      payload = validator.check(params['token'], Rails.application.credentials.google_client_id)
      User.from_google(payload)
    rescue GoogleIDToken::ValidationError => e
      puts "Cannot validate: #{e}"
    end
  end

end