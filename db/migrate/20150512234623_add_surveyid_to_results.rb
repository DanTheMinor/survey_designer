class AddSurveyidToResults < ActiveRecord::Migration
  def change
  end
  add_column(:results, :survey_id, :integer)
end
