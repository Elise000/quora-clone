# get "questions/:question_id/answers/new" do
# 	@question = Question.find(params[:question_id])
#   erb :"answers"
# end

post "/questions/:question_id/answers" do
	if logged_in?
		@question = Question.find(params[:question_id])
		@answer = Answer.create(question_id: @question.id, description: params[:answer][:description], user_id: current_user.id)
		redirect to "/questions/#{@question.id}"

		# redirect to @question.description.to_json
	else
		redirect '/'
	end
end

get "/questions/:question_id/answers" do
	@user = User.find(session['user_id'])
	@question = Question.find(params[:question_id])
	byebug
	@answers = @question.answers
	erb :"answers/answers_show"
end

# get "/users/:user_id/questions" do
# 	@user = User.find(session['user_id'])
# 	@questions = @user.questions
# 	@answers = @user.answers
# 	erb :"users/users_show"
# end




