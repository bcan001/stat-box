class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
    	t.string :name
    	t.integer :league_id
    	t.integer :sport_id
    end
    add_index :teams, :league_id
    add_index :teams, :sport_id
  end
end

