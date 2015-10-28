require 'byebug'


post "/questions" do
	# byebug
	user = User.find(session['user_id'])
	@question = user.questions.new(params[:question])
	@question.save
	redirect to "/home"
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


get "/home" do
	@user = User.find(session['user_id'])
	erb :"static/home"
end