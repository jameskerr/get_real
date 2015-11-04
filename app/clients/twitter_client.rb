class TwitterClient
  class << self
    def method_missing(method, *args)
      self.client.send(method, *args)
    end

    def respond_to?(method_name, include_private = false)
      client.respond_to?(method_name)
    end

    def client
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = '9JgscNp9wwS9WLBY7uGOKjmkl'
        config.consumer_secret     = 'TBUOGP4r29g0Otl325L4dWD06z7D5fCXoR7UUTa7auyFq44Kww'
        config.access_token        = '626047744-9Rr51EZBf2gef47hk7ngGjCu6LGGLfEgZPdrQM3P'
        config.access_token_secret = 'JkqflDufEBSoRwbWMlXtt6ai38gLVpofUaddVRrZOdLU1'
      end
    end
  end
end