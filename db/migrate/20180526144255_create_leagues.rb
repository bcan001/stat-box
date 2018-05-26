class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
    	t.integer :sport_id
    	t.string :name
    end
    add_index :leagues, [:sport_id,:name]
    add_index :leagues, :name
  end
end
