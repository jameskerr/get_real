class FacebookClient
  class << self
    def updates
      @updates ||= Koala::Facebook::RealtimeUpdates.new(app_id: app_id, secret: app_secret)
    end

    def oauth
      @oauth ||= Koala::Facebook::OAuth.new(app_id, app_secret, callback_url)
    end

    def app_id
     '311871182316461'
    end

    def app_secret
      'd8c9e670c34fe4308b603fd5a2ee11fe'
    end

    def callback_url
      "http://getreal.ngrok.io/facebook/callback"
    end

    def test_users
      @test_users ||= Koala::Facebook::TestUsers.new(app_id: app_id, secret: app_secret)
    end

    def test_user
      user = test_users.create(true, ["feed"])
      Koala::Facebook::API.new(user["access_token"])
    end
  end
end