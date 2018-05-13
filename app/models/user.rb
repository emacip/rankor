class User < ApplicationRecord

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
        provider: auth[:provider],
        uid: auth[:uid],
        name: auth[:info][:name],
        email: auth[:info][:email],
        first_name: auth[:info][:first_name],
        last_name: auth[:info][:last_name],
        token: auth[:credentials][:token],
        refresh_token: auth[:credentials][:refresh_token],
        expires_at: auth[:credentials][:expires_at]
    }
    user.save!
    return user

  end
end
