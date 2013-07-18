class UsersController < ApplicationController
	before_filter :authorize

	def index
		@users = Users.order_by_karma
	end

	def new
		@user = User.new
	end

	def create
		@user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_url
    end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])
		redirect_to user_path(@user)
	end

	def destroy
		User.find(session[:user_id]).destroy
		sessions.clear
		redirect_to root_url
	end
end
