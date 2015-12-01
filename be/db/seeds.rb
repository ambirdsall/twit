def write_tweet
  t = ""
  until t.present? && t.length <= 140 do
    t = Faker::Lorem.sentences(3).join ' '
  end
  t
end

5.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email)
end

User.all.each do |user|
  10.times { user.tweets.create(text: write_tweet) }
end
