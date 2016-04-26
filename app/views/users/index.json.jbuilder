json.array!(@users) do |user|
  json.extract! user, :id, :name, :gender, :birthdate, :profile_img
  json.url user_url(user, format: :json)
end
