class CreateQuestions < ActiveRecord::Migration
  def change
    create_table(:questions) do |t|
      t.column(:description, :string)
      t.column(:answer, :integer)

      t.timestamps()
    end
  end
end
