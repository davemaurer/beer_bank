class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    user = find_or_create_by(uid: auth_info.uid)
    user.update_attributes(
      name: auth_info.extra.raw_info.name,
      profile_picture: auth_info.extra.raw_info.profile_image_url,
      oauth_token: auth_info.credentials.token,
      oauth_token_secret: auth_info.credentials.secret
    )

    user
  end

  def twitter_client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['twitter_key']
      config.consumer_secret = ENV['twitter_secret']
      config.access_token = oauth_token
      config.access_token_secret = oauth_token_secret
    end
  end

  def brewery_client
    @brew_client ||= Brew::REST::Client.new do |config|
      config.consumer_key = ENV['brewery_key']
      config.access_token = oauth_token
      config.access_token_secret = oauth_token_secret
    end
  end
end
