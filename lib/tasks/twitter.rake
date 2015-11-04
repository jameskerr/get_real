namespace :twitter do

  task :listen => :environment do
    client = TweetStream::Client.new

    client.on_delete do |status_id, user_id|
      ap "Delete this tweet #{status_id}"
    end

    client.follow(Account.twitter.pluck(:identifier)) do |status|
      ap Post.create(raw: status.as_json)
    end
  end
end
