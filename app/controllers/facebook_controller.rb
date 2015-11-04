class FacebookController < ApplicationController
  def connect
    redirect_to FacebookClient.oauth.url_for_oauth_code
  end

  def callback
    token =  FacebookClient.oauth.get_access_token(params[:code])
    @graph = Koala::Facebook::API.new(token)
    profile = @graph.get_object("me")
    @account = Account.new({
      token: token,
      service: 'facebook',
      raw: profile.as_json,
      username: profile["name"],
      identifier: profile["id"]
      })
    if @account.save
      redirect_to @account, notice: 'Successfully saved'
    else
      redirect_to new_account_path, notice: 'Failed to save facebook account'
    end
  end

  def user_updates
    render text: Koala::Facebook::RealtimeUpdates.meet_challenge(params, 'your_verify_token')
  end

  def subscriptions
    render json: FacebookClient.updates.list_subscriptions
  end
end
