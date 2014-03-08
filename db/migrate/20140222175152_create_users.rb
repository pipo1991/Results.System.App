class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.string :account_type
      t.string :game_special
      t.timestamps
    end
  end
  
  def down
    drop_table :users
  end
end
