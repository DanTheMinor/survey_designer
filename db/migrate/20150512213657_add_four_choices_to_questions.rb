class AddFourChoicesToQuestions < ActiveRecord::Migration
  def change
  end
  add_column(:questions, :choice_1, :string)
  add_column(:questions, :choice_2, :string)
  add_column(:questions, :choice_3, :string)
  add_column(:questions, :choice_4, :string)
  remove_column(:questions, :answer)
  add_column(:questions, :correct_answer, :string)
end
