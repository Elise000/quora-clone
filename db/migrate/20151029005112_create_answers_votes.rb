class CreateAnswersVotes < ActiveRecord::Migration
	def change
		create_table :answers_votes do |t|
	    t.integer :upvote, :default => 0
	    t.integer :downvote, :default => 0
	    t.timestamps null: false
	    t.integer :answer_id
	    t.integer :user_id
		end
	end
end
