class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Successfully logged in :)"
    else
      redirect_to root_url, notice: "Invalid username and/or password :("
    end
  end

  def destroy
    sessions.clear
    redirect_to root_url, notice: "Successfully logged out :)"
  end
end
