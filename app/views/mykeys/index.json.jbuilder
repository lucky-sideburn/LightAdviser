json.array!(@mykeys) do |mykey|
  json.extract! mykey, :id, :content, :user_id
  json.url mykey_url(mykey, format: :json)
end
