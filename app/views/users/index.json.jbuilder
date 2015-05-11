json.array!(@users) do |user|
  json.extract! user, :id, :username, :mobile, :age, :sex, :sn, :used_at
  json.url user_url(user, format: :json)
end
