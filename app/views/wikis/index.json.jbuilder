json.array!(@wikis) do |wiki|
  json.extract! wiki, :id, :user_id, :name, :body
  json.url wiki_url(wiki, format: :json)
end
