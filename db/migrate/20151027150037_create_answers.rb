class CreateAnswers < ActiveRecord::Migration

	def change
    create_table :answers do |t|
      t.string :description
      t.timestamps null: false
      t.integer :question_id
      t.integer :user_id
    end
  end
end