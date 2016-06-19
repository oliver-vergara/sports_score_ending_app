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
    
