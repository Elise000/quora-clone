post "/questions/:question_id/upvote" do
	if logged_in?
		@question = Question.find(params[:question_id])
		qv = @question.questions_votes
		@vote_exist = qv.find_by(user_id: current_user.id)

		if @vote_exist
			@vote_exist.upvote = 1
			@vote_exist.downvote = 0
			@vote_exist.save
		else
			@question_vote = QuestionsVote.create(upvote: 1, question_id: @question.id, user_id: current_user.id)
		end

			redirect to "/questions"
	else
		redirect '/'
	end
end

post "/questions/:question_id/downvote" do
	if logged_in?
		@question = Question.find(params[:question_id])
		qv = @question.questions_votes
		@vote_exist = qv.find_by(user_id: current_user.id)

		if @vote_exist
			@vote_exist.upvote = 0
			@vote_exist.downvote = 1
			@vote_exist.save
		else
			@question_vote = QuestionsVote.create(downvote: 1, question_id: @question.id, user_id: current_user.id)
		end
			redirect to "/questions"
	else
		redirect '/'
	end
end