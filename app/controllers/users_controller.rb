class UsersController < ApplicationController
	include UsersHelper

	before_filter :authorize, except: :index

	def index
		@users = Users.order_by_karma
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to root_url, notice: "You successfully created an account!"
		else
			render 'new', notice: "Error!"
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
