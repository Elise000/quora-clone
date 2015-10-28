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

  erb :"static/index"
end

post '/login' do
  @u = User.authenticate(params[:user][:email], params[:user][:password])
  if @u.nil?
    @message = "Invalid User"
  else
    session[:user_id] = @u.id
    erb :"static/home"
  end
end

get '/users/:id' do
  @user=User.find(params[:id])
  byebug
  erb :"users/show"
end

get '/logout' do

end