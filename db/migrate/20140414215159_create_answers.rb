class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :answer
      t.boolean :chosen_answer

      t.timestamps
    end
  end
end
