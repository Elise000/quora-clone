require 'byebug'


post "/questions" do
	# byebug
	user = User.find(session['user_id'])
	@question = user.questions.new(params[:question])
	@question.save
	redirect to "/questions"
end

get "/users/:user_id/questions" do
	# byebug
	@user = User.find(params['user_id'])
	@questions = @user.questions.all
  erb :"questions/questions_index"
end

get "/questions" do
	@user = User.find(session['user_id'])
	@questions = Question.all
	erb :"static/home"
end

get "/questions/:id" do
	@user = User.find(session['user_id'])
	@question = Question.find(params[:id])
	@answers = @question.answers
	erb :"questions/questions_show"
end

get "/questions/:id/edit" do
	@user = current_user
	@question = Question.find(params[:id])
	erb :"questions/questions_edit"
end

put "/questions/:id/edit" do
	@user = current_user
	@question = Question.find(params[:id])
	@question[:description] = params[:question][:description]
	@question.save
	redirect "questions/#{@user.id}"
end

delete "/questions/:id" do
	@user = current_user
	@question = Question.find(params[:id])
	@question.destroy
	redirect "/users/#{@user.id}/questions"
end