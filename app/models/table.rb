class Table < ActiveRecord::Base
  attr_accessible :time,:player,:opponent,:winner,:game_played,:game_played_id,:player_id,:opponent_id,:place_id
  belongs_to :player, :class_name => 'User'
  belongs_to :opponent, :class_name => 'User'
  belongs_to :game_played, :class_name => 'Game'
  
  validates_presence_of :time
  validates_presence_of :player
  validates_presence_of :opponent
  validates_presence_of :game_played
  
end
