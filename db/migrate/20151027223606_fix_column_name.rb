class FixColumnName < ActiveRecord::Migration
	def change
		rename_column :questions, :question, :description
		rename_column :answers, :answer, :description
	end
end
