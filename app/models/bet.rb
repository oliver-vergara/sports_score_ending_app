class Bet < ActiveRecord::Base

belongs_to :user
belongs_to :game
belongs_to :combo


validates :better_id, uniqueness: {scope: [:better_id, :combo_id, :game_id]}

end
