class Game < ActiveRecord::Base

has_many :bets
has_many :users, through: :bets


end
