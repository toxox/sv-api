require 'jwt'

class Auth 
  def self.encode_email(email)
    payload = { email: email }
    JWT.encode(
      payload, 
      Rails.application.credentials.auth_secret, 
      'HS256'
    )
  end
  
  def self.decode_token(token)
    payload = JWT.decode(
      token, 
      Rails.application.credentials.auth_secret, 
      true,
      { :algorithm => 'HS256' }
    )

    payload.first
  end

  def self.read_token_from_request(request)
    token = request.headers['Authorization']
                   .scan(/Bearer (.*)$/).flatten.last
  end

  def self.auth_present?(request)
    !!request.headers['Authorization']
              .scan(/Bearer/).flatten.first
  end
end