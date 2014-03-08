class CreateBlindTimes < ActiveRecord::Migration
  def change
    create_table :blind_times do |t|
      t.time :time

      t.timestamps
    end
  end
end
