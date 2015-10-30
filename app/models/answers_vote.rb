class AnswersVote < ActiveRecord::Base
	belongs_to :user
	belongs_to :answer
	# This is Sinatra! Remember to create a migration!
end
