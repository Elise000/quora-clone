require 'byebug'
enable :sessions

get '/signup' do
  erb :"static/index"
end

post '/signup' do
  @user = User.new(params[:user])

  if @user.save
    redirect '/login'
  else
    @error_msg = "Bummer, Sign up failed"
    erb :"static/index"
  end
end


get '/login' do
  @user = User.find(session[:user_id])
  erb :"static/index"
end

post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    erb :"static/home"

  else
    @message = "Invalid User"
    redirect "/login"
  end
end

get '/users/:id' do
  @user=User.find(params[:id])
  erb :"users/show"
end

get '/logout' do

end