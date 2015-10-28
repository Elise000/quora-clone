class CreateQuestions < ActiveRecord::Migration
	def change
    create_table :questions do |t|
      t.string :description
      t.timestamps null: false
      t.integer :user_id
    end
	end
end
