ActiveRecord::Base.connection.reset_pk_sequence!('posts')

15.times do
  Post.create!(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph(sentence_count: 4),
    live: Faker::Boolean.boolean
  )
end