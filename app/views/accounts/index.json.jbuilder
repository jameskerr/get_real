json.array!(@accounts) do |account|
  json.extract! account, :id, :username, :identifier, :service
  json.url account_url(account, format: :json)
end
