4.times do
  user = User.new(username: Faker::Internet.user_name)
  user.password = '123'
  user.save
  2.times do
    user.posts.create(title: Faker::Hacker.say_something_smart,
                      body: Faker::Lorem.paragraph)
  end
  user.posts.create(title: Faker::Hacker.say_something_smart,
                    url: 'http://cnn.com')
end

User.all.each do |user|
  user.posts.each do |post|
    5.times do
      random_user = User.all.sample #first(:order => "RANDOM()")
      post.comments.create(text: Faker::Hacker.say_something_smart,
                           user: random_user)
    end
  end
end