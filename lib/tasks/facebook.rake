namespace :facebook do

  task listen: :environment do
    FacebookClient.updates.subscribe("user", "feed", "http://getreal.ngrok.io/facebook/user_updates", "your_verify_token")
  end
end