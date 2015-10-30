post "/answers/:answer_id/upvote" do
	if logged_in?
		@answer = Answer.find(params[:answer_id])
		av = @answer.answers_votes
		@answer_exist = av.find_by(user_id: current_user.id)

		if @answer_exist
			@answer_exist.upvote = 1
			@answer_exist.downvote = 0
			@answer_exist.save
		else
			@answer_vote = AnswersVote.create(upvote: 1, answer_id: @answer.id, user_id: current_user.id)
		end
			redirect to "/questions/#{@answer.question.id}"
	else
		redirect '/'
	end
end

post "/answers/:answer_id/downvote" do
	if logged_in?
				@answer = Answer.find(params[:answer_id])
		av = @answer.answers_votes
		@answer_exist = av.find_by(user_id: current_user.id)

		if @answer_exist
			@answer_exist.upvote = 0
			@answer_exist.downvote = 1
			@answer_exist.save
		else
			@answer_vote = AnswersVote.create(upvote: 1, answer_id: @answer.id, user_id: current_user.id)
		end
			redirect to "/questions/#{@answer.question.id}"
	else
		redirect '/'
	end
end