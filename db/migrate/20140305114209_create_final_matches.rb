class CreateFinalMatches < ActiveRecord::Migration
  def change
    create_table :final_matches do |t|
      t.time :time
      t.string :player
      t.string :opponent
      t.string :game
      t.string :winner

      t.timestamps
    end
  end
end
