class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :questions_votes, dependent: :destroy

   	def totalupvotes
  		total_upvotes = questions_votes.where(upvote: 1).count
      return total_upvotes
    end

    def totaldownvotes
  	 total_downvotes = questions_votes.where(downvote: 1).count
  		return total_downvotes
  	end
	# This is Sinatra! Remember to create a migration!
end

