namespace :instagram do
  task listen: :environment do
    ap Instagram.create_subscription('user', 'http://getreal.ngrok.io/instagram/user_updates')
  end
end