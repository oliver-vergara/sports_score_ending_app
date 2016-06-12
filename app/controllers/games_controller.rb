class GamesController < ApplicationController

  def index
    @games = Game.all

    if current_user
        games_of_user = current_user.games.where(complete: true)
        #determine winner, and update winner's balance
    end
  end

  def new

  end

  def create
    @game = Game.new(name: params[:name], schedule: params[:schedule], bet_amount: params[:bet_amount], banker_id: current_user.id, banker: current_user.username)
    @game.save
    redirect_to "/games/#{@game.id}"
  end

  def show
    @rows = []
    @row_1 = Combo.all[0..9]
    @row_2 = Combo.all[10..19]
    @row_3 = Combo.all[20..29]
    @row_4 = Combo.all[30..39]
    @row_5 = Combo.all[40..49]
    @row_6 = Combo.all[50..59]
    @row_7 = Combo.all[60..69]
    @row_8 = Combo.all[70..79]
    @row_9 = Combo.all[80..89]
    @row_10 = Combo.all[90..99]

    @rows << @row_1
    @rows << @row_2
    @rows << @row_3
    @rows << @row_4
    @rows << @row_5
    @rows << @row_6
    @rows << @row_7
    @rows << @row_8
    @rows << @row_9
    @rows << @row_10

    @game = Game.find_by(id: params[:id])
    @bets = Bet.where(game_id: @game.id)
    @pot = @game.bet_amount * 90

    @winner = @game.winning_score
    @loser = @game.losing_score
    if @winner && @loser && @game.completed == false
        @winning_combo = ((@winner % 10).to_s + "-" + (@loser % 10).to_s)
        @winning_combo_id = Combo.find_by(pick: @winning_combo).id
        @winning_user = User.find((Bet.find_by(combo_id: @winning_combo_id).better_id)) 
        @total_balance = @winning_user.balance + @pot
        @winning_user.update_attributes({'balance': @total_balance})
        @game.completed = true
        @game.save
    end
  end
end

    

    














