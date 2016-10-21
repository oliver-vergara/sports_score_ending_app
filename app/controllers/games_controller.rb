    class GamesController < ApplicationController
    before_action :authenticate_user!, except: [:index]

  def index
    @games = Game.all

    if current_user
        games_of_user = current_user.games
        #determine winner, and update winner's balance
    end
  end


  def new

  end

  def create
    start_time = DateTime.strptime(params[:start_time], "%m/%d/%Y %I:%M %p")
    @game = Game.new(name: params[:name], start_time: start_time, bet_amount: params[:bet_amount], banker_id: current_user.id, banker: current_user.username, completed: false)
    pot_reserve = @game.bet_amount * 100
    if current_user.balance < pot_reserve
        flash[:error] = "You do not have enough money to start this!"
        redirect_to "/users/add_funds_form"
    else
        current_user.update(balance: current_user.balance - pot_reserve)
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
    @tip = @game.bet_amount * 10
    @pool = @game.bets.count * @game.bet_amount 

    if Time.now >= @game.start_time
        @game_started = true
    else
        @game_started = false
    end


    @winner = @game.winning_score
    @loser = @game.losing_score
    if @winner != 0 && @loser != 0 && @game.completed == true
        @winning_combo = ((@winner % 10).to_s + "-" + (@loser % 10).to_s)
        @winning_combo_id = Combo.find_by(pick: @winning_combo).id

        @winning_bet = Bet.where(combo_id: @winning_combo_id, game_id: @game.id)
        if @game.bets && !@winning_bet.empty?
            @winning_user = User.find((Bet.find_by(combo_id: @winning_combo_id).better_id))
        end 
    end

  end

  def score_input_form
    @game = Game.find_by(id: params[:id]) 
  end

  def score_input
    @game = Game.find_by(id: params[:id]) 
    @game.winning_score = params[:winning_score]
    @game.losing_score = params[:losing_score]
    @game.completed = true

    # If user wins
    @pot = @game.bet_amount * 90 # For user
    @tip = @game.bet_amount * 10 # For banker

    # If banker wins
    @pool = @game.bets.count * @game.bet_amount

    if @game.save
        @winner = @game.winning_score
        @loser = @game.losing_score
        if @winner != 0 && @loser != 0
            @winning_combo = ((@winner % 10).to_s + "-" + (@loser % 10).to_s)
            @winning_combo_id = Combo.find_by(pick: @winning_combo).id

            @winning_bet = Bet.find_by(combo_id: @winning_combo_id)
            if @game.bets && @winning_bet
                # User wins
                @winning_user = User.find((Bet.find_by(combo_id: @winning_combo_id).better_id))
                @new_user_balance = @winning_user.balance + @pot
                @winning_user.update(balance: @new_user_balance)
            elsif @game.bets
                # Banker wins
                @banker = User.find_by(id: @game.banker_id)
                @new_banker_balance = @banker.balance + @pot + @tip + @pool
                @banker.update(balance: @new_banker_balance)
            end 
        end

        flash[:success] = "Score Updated"
    else
        flash[:danger] = "Game has not started yet."
    end
    redirect_to "/games/#{@game.id}"
  end


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



    

    














