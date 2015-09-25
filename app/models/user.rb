class User < ActiveRecord::Base
  def self.create_with_omniauth(auth_hash)
    create! do |user|
      user.provider = auth_hash["provider"]
      user.uid      = auth_hash["uid"]
      user.email    = auth_hash["info"]["email"]
    end
  end
end
