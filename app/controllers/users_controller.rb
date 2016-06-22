class UsersController < ApplicationController


  def games
    
    id = params[:id]
    @user = User.find(id)

    @banker_games = Game.where(banker_id: @user.id)


    @better_games = []
    user_bets = Bet.select(:better_id, :game_id).uniq.where(better_id: @user.id)
    user_bets.each do |bet|
      game = Game.find(bet.game_id)
      @better_games << game
    end

    @user_games = @banker_games + @better_games


  end

  def add_funds_form
    @user = User.find_by(id: current_user.id)
  end

  def add_funds
    @user = User.find_by(id: current_user.id)
    if @user.balance == nil
      @user.balance = 0
    end
    @user.balance += params[:balance].to_i
    @user.save
    flash[:success] = "Funds Added"
    redirect_to "/"
  end

  def show
 
  end

  def edit
    
  end

  def update
    user = User.find_by(id: current_user.id)
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.username = params[:username]
    user.save
    flash[:success] = "Profile Updated"
    redirect_to "/users/#{user.id}"
  end
end
    
