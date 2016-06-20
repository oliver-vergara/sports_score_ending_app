class GamesController < ApplicationController
    before_action :authenticate_user!, except: [:index]

  def index
    @games = Game.all

    if current_user
        games_of_user = current_user.games
        #determine winner, and update winner's balance
    end


    # response_schedule = Unirest.get("http://api.sportradar.us/nba-t3/games/2016/06/10/schedule.json?api_key=5b9xdyg9pdam7ghgq4n9pwn9").body


    # response_schedule["games"].each do |game|

    #     game_summary = Unirest.get("http://api.sportradar.us/nba-t3/games/#{game["id"]}/summary.json?api_key=5b9xdyg9pdam7ghgq4n9pwn9").body
    #     # puts "Game: #{game_summary.body}"
    #     binding.pry
        
    #     if game_summary
    #         p game_summary["away"]["points"]
    #         p game_summary["home"]["points"]
    #     end

        # game_summary = game_summary.body
        # # game_summary = game_summary.body


        # puts "Home team:" + game_summary["home"]["market"] + game_summary["home"]["name"]
        # puts "Away team:" + game_summary["away"]["market"] + game_summary["away"]["name"]
        # puts "Final score:" + game_summary["home"]["points"] + " - " + game_summary["away"]["points"]

    # end


  end

  def new

  end

  def create
    @game = Game.new(name: params[:name], schedule: params[:schedule], bet_amount: params[:bet_amount], banker_id: current_user.id, banker: current_user.username, completed: false)
    if current_user.balance < 100
        flash[:error] = "You do not have enough money to start this!"
        redirect_to "/users/add_funds_form"
    else
        @game.save
        redirect_to "/games/#{@game.id}"
    end
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

    

    














