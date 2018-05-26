class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
    	t.datetime :match_datetime
    	t.integer :sport_id
    	t.integer :league_id
    	t.integer :team1_id
    	t.integer :team2_id
    end
    add_index :matches, [:match_datetime,:sport_id]
    add_index :matches, [:match_datetime,:league_id]
    add_index :matches, [:team1_id,:match_datetime]
    add_index :matches, [:team2_id,:match_datetime]
  end
end
