class CreateSurveys < ActiveRecord::Migration
  def change
    create_table(:surveys) do |t|
      t.column(:title, :string)
      t.timestamps()
  end
    add_column(:questions, :survey_id, :integer)
    #add_column(:results, :survey_id, :integer)
  end
end
