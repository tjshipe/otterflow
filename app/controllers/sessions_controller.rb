class SessionsController < ApplicationController

  def new
    @user ||= User.new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Successfully logged in :)"
    else
      redirect_to :back, notice: "Username and/or password is not valid :("
    end
  end

  def logout
    session.clear
    redirect_to root_url, notice: "Successfully logged out :)"
  end
end
