class CreateAnswers < ActiveRecord::Migration

	def change
    create_table :answers do |t|
      t.string :answer
      t.timestamps null: false
      t.integer :question_id
      t.integer :user_id
    end
  end
end