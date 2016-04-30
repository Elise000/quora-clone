require 'byebug'
enable :sessions

# get '/signup' do
#   erb :"static/index"
# end

before do
  path = ["/", "/signup", "/login", "/questions"]
  pass if logged_in? || path.include?(request.path_info)
  redirect "/"
end

post '/signup' do
  @user = User.new(params[:user])

  if @user.save
    redirect '/'
  else
    @error_msg = "Bummer, Sign up failed"
    erb :"static/index"
  end
end

# get '/login' do
#   byebug
#   @user = User.find(session[:user_id])
#   erb :"static/index"
# end

post '/login' do
  # byebug
  @user = User.authenticate(params[:user][:email], params[:user][:password])

  if @user
    session[:user_id] = @user.id
    redirect "/questions"
  else
    @error_msg = "Invalid User"
    erb :"static/index"
  end
end

get '/users/:id' do
  @user=User.find(params[:id])
  @questions = @user.questions.all
  @answers = @user.answers.all
  erb :"users/show"
end

get '/logout' do
  session[:user_id] = nil
  erb :"static/index"
end