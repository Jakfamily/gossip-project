require 'faker'

# création de 10 villes avec des codes postaux français
10.times do
  city = City.create(
    name: Faker::Address.city,
    zip_code: Faker::Number.number(digits: 5)
  )
end

# création de 10 utilisateurs et assignation aléatoire à une ville
10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    email: Faker::Internet.email,
    age: rand(18..80)
  )
  user.city = City.all.sample
  user.save
end

# création de 10 tags
10.times do
  Tag.create(
    title: Faker::Lorem.word
  )
end

# création de 20 gossips et assignation aléatoire à un utilisateur et à un tag
20.times do
  gossip = Gossip.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 5)
  )
  gossip.user = User.all.sample
  gossip.tags << Tag.all.sample
  gossip.save
end

# création de quelques messages privés
3.times do
  sender = User.all.sample
  recipient = User.all.sample
  while recipient == sender
    recipient = User.all.sample
  end
  PrivateMessage.create(
    content: Faker::Lorem.paragraph(sentence_count: 2),
    sender: sender,
    recipient: recipient
  )
end

# création de 20 commentaires et assignation aléatoire à un utilisateur et à un gossip
20.times do
  comment = Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  comment.user = User.all.sample
  comment.commentable = [Gossip.all, Comment.all].sample.sample
  comment.save
end

# création de 20 likes aléatoires
20.times do
  like = Like.create
  like.user = User.all.sample
  like.likeable = [Gossip.all, Comment.all].sample.sample
  like.save
end
