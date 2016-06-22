class Game < ActiveRecord::Base

  has_many :bets
  has_many :users, through: :bets


  validate :game_complete


  def game_complete
    if (Time.now() <= start_time) && (completed == true)
      errors.add(:start_time, "Game has not started yet.")
    end
  end

end
