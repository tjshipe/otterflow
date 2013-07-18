10.times do
	@user = User.create(username: Faker::Internet.email, password_hash: Faker::Lorem.words(num = 1))
	5.times do
	  @question = Question.create(user_id:@user.id, title: Faker::Company.catch_phrase, body: Faker::Lorem.sentences(sentence_count = 3))
      3.times do
		@answer = Answer.create(user_id:@user.id, text: Faker::Lorem.sentences(sentence_count = 3))
      end	  
	end
end

20.times do
  @favorite = Favorite.create(user_id: (rand(10)+1), question_id: (rand(50)+1))
end

10.times do
  @category = Category.create( text:Faker::Company.bs)
end

20.times do
  @tag = Tag.create(question_id: (rand(50)+1), category_id: (rand(10)+1))
end

30.times do
  @vote = Vote.create(is_positive: true, user_id: (rand(10)+1), question_id: (rand(50)+1))
end

30.times do
  @vote = Vote.create(is_positive: true, user_id: (rand(10)+1), answer_id: (rand(150)+1))
end

20.times do
	@comment = Comment.create(user_id: (rand(10)+1), text: Faker::Lorem.sentences(sentence_count = 2), question_id: (rand(50)+1))
end

20.times do
	@comment = Comment.create(user_id: (rand(10)+1), text: Faker::Lorem.sentences(sentence_count = 2), answer_id: (rand(50)+1))
end