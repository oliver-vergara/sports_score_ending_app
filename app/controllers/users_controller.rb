class UsersController < ApplicationController

  def add_funds_form
    @user = User.find_by(id: current_user.id)
  end

  def add_funds
    @user = User.find_by(id: current_user.id)
    @user.balance += params[:balance].to_i
    @user.save
    flash[:success] = "Funds Added"
    redirect_to "/"
  end
end
