class ApplicationController < ActionController::API
  def logged_in?
    !!current_user
  end

  def current_user
    return @current_user if @current_user
    if Auth.auth_present?(request)
      payload = Auth.decode_token(Auth.read_token_from_request(request))
      @current_user = User.find_by(email: payload['email'])
      return @current_user if @current_user
    end
  end

  def authenticate
    render json: {error: "unauthorized"}, 
                 status: 401 unless logged_in?
  end
end
