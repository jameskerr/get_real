class InstagramController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :user_updates

  def connect
    redirect_to Instagram.authorize_url(redirect_uri: INSTAGRAM_CALLBACK_URL)
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => INSTAGRAM_CALLBACK_URL)
    @account = Account.new({
      token: response.access_token,
      identifier: response.user.id,
      username: response.user.username,
      service: 'instagram',
      raw: response.user.as_json
      })
    if @account.save
      redirect_to @account, notice: 'Successfully added account'
    else
      redirect_to new_account_path, alert: 'Failed to save that account'
    end
  end

  def user_updates
    if request.get?
      render text: params["hub.challenge"]
    else
      params[:_json].each do |changed_media|
        raw = Instagram.client.media_item(changed_media[:data][:media_id])
        Post.create(raw: raw.as_json)
      end
      render nothing: true
    end
  end

  def subscriptions
    render json: Instagram.subscriptions
  end
end
