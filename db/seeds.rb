10.times do
	@user = User.new(username: Faker::Internet.email)
  @user.password = Faker::Lorem.words(num = 1)
  @user.save
	5.times do
	  @user.questions << Question.create(title: Faker::Company.catch_phrase, body: Faker::Lorem.sentences(sentence_count = 3))
      3.times do
        Answer.create(user_id:@user.id, text: Faker::Lorem.sentences(sentence_count = 3), question_id: (rand(50)+1))
      end
	end
end

@answers = Answer.all
@questions = Question.all

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
  @vote = Vote.create(positive: true, user_id: (rand(10)+1))
  @vote.voteable = @questions.sample
  @vote.save
end

30.times do
  @vote = Vote.create(positive: true, user_id: (rand(10)+1))
  @vote.voteable = @answers.sample
  @vote.save
end

20.times do
	@comment = Comment.create(user_id: (rand(10)+1), text: Faker::Lorem.sentences(sentence_count = 2))
  @comment.commentable = @questions.sample
  @comment.save
end

20.times do
	@comment = Comment.create(user_id: (rand(10)+1), text: Faker::Lorem.sentences(sentence_count = 2))
  @comment.commentable = @answers.sample
  @comment.save
end
