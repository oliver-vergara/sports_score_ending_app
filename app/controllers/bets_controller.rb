class BetsController < ApplicationController

  def index

  end

  def new

  end

  def create
    @bet = Bet.new
  end

  def batch
    pick_ids = []
    params.each do |key, value|
      pick_ids << key if value == "true"
    end
    pick_ids.each do |pick_id|
      Bet.new(combo_id: pick_id, better_id: current_user.id, )
    end
  end


end
