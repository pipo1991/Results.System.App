class CreateTables < ActiveRecord::Migration
  def up
    create_table :tables do |t|
      t.time :time
      t.references :game_played
      t.references :player
      t.references :opponent
      t.references :place
      t.string :winner
      t.timestamps
    end
  end
  
  def down
    drop_table :tables
  end
end
