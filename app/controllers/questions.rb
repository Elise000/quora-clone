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
	user = User.find(session['user_id'])
	@questions = user.questions.all
  erb :"questions/questions_index"
end


get "/users/:user_id/questions/:question_id" do
  erb :"questions_show"
end

get "/questions" do
	@questions = Question.all
	erb :"static/home"
end