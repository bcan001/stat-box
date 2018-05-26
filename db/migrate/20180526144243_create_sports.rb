class CreateSports < ActiveRecord::Migration[5.2]
  def change
    create_table :sports do |t|
    	t.string :name
    end
    add_index :sports, :name
  end
end
