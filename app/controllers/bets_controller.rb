class BetsController < ApplicationController

  def index

  end

  def new

  end

  # def create
  #   @bet = Bet.new
  # end

  def batch
    pick_ids = []
    params.each do |key, value|
      pick_ids << key if value == "true"
    end

    

    pick_ids.each do |pick_id|
      bet = Bet.new(combo_id: pick_id, better_id: current_user.id, game_id: params[:game_id])
      bet.save
    end
      redirect_to "/games/#{params[:game_id]}"
  end


end
