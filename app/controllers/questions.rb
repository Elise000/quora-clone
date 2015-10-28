get '/users/:user_id/questions' do

  erb :"questions_index"
end


get '/users/:user_id/questions/:question_id' do
  erb :"questions_show"
end