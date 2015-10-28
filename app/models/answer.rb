class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
	# This is Sinatra! Remember to create a migration!
end
