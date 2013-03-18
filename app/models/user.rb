class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :token, :token_secret, :body, :name

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.token = auth["credentials"]["token"]
      user.token_secret = auth["credentials"]["secret"]
      user.body = auth["extra"]["access_token"].response.body
    end
  end
  
  def name
    @name = JSON.parse(self.body)["first_name"] + " " + JSON.parse(self.body)["last_name"]
  end
end