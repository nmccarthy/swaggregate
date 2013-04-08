module Readability
  require 'net/http'
  require 'json'
  require 'oauth'

  def self.add_url
    user = User.find(3)
    oauth_token = user.token
    oauth_token_secret = user.token_secret
    url = "http://swaggregate.blogspot.com/2013/04/omg-clay-aiken.html"

    # base_url = 'www.readability.com'
    # port = 443
    # api = Net::HTTP.new(base_url)

    # response = api.post('/api/rest/v1/bookmarks?url=#{url}&token=#{access_token}', nil)
    # response = yammer_api.post("https://www.yammer.com/api/v1/streams/activities.json?access_token=#{token}", payload, {"Content-Type" => "application/x-www-form-urlencoded"})

    # get the access token
    key = ENV['SWAGGREGATE_READABILITY_CLIENT_ID']
    secret = ENV['SWAGGREGATE_READABILITY_CLIENT_SECRET']

    consumer = OAuth::Consumer.new(key, secret, {:site => "https://www.readability.com"})

    token_hash = {
      :oauth_token => oauth_token,
      :oauth_token_secret => oauth_token_secret
    }

    access_token = OAuth::AccessToken.from_hash(consumer, token_hash)

    response = access_token.post('/api/rest/v1/bookmarks', { :url => url }, { 'Content-Type' => 'application/x-www-form-urlencoded' })
  end
end