class ApplicationController < ActionController::API
  def logged_in?
    !!current_user
  end

  def current_user
    return @current_user if @current_user
    if auth_present?
      payload = Auth.decode_token(read_token_from_request)
      @current_user = User.find_by(email: payload['email'])
      return @current_user if @current_user
    end
  end

  def authenticate
    render json: {error: "unauthorized"}, 
                 status: 401 unless logged_in?
  end

  private

  def read_token_from_request
    token = request.headers['Authorization']
                   .scan(/Bearer (.*)$/).flatten.last
  end

  def auth_present?
    !!request.headers['Authorization']
              .scan(/Bearer/).flatten.first
  end
end
