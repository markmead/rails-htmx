10.times do 
  Post.create!(title: Faker::Book.title,
    body: Faker::Lorem.paragraph(sentence_count: 4),
    live: Faker::Boolean.boolean)
end