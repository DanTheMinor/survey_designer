class RemoveCorrectAnswerFromQuestions < ActiveRecord::Migration
  def change
  end
  remove_column(:questions, :correct_answer)
end
