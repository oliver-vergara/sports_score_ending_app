class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new

  end

  def create

  end

  def show
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
    @bet_amount = Game.find_by(id: params[:id]).bet_amount
    @name = Game.find_by(id: params[:id]).name
    @schedule = Game.find_by(id: params[:id]).schedule
    # @banker = Bet.find_by(id: params[:id]).banker_id
  end


end
