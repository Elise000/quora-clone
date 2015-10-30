class CreateQuestionsVotes < ActiveRecord::Migration
	def change
		create_table :questions_votes do |t|
	      t.integer :upvote, :default => 0
	      t.integer :downvote, :default => 0
	      t.timestamps null: false
	      t.integer :question_id
	      t.integer :user_id
		end
	end
end
