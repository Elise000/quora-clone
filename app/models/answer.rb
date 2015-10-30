class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :answers_votes, dependent: :destroy

  	def totalupvotes
  		total_upvotes = answers_votes.where(upvote: 1).count
      return total_upvotes
    end

    def totaldownvotes
  	 total_downvotes = answers_votes.where(downvote: 1).count
  		return total_downvotes
  	end
	# This is Sinatra! Remember to create a migration!
end
