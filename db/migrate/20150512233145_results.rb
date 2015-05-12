class Results < ActiveRecord::Migration
  def change
    create_table(:results) do |t|
      t.column(:answers, :string)
      t.timestamps()
    end
    
  end
end
