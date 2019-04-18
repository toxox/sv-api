class User < ApplicationRecord
  def self.from_google(payload) 
    User.find_or_create_by(email: payload['email']) do |u|
      u.email = payload['email']
      u.nickname = payload['email'].split('@').first
      u.provider = 'google'
    end
  end
end
