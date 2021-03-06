class UsersController < ApplicationController

	before_filter :authorize, except: [:index, :show, :new, :create]

	def index
		@users = User.order_by_karma
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(username: params[:user][:username])
		@user.password = params[:user][:password]
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "You successfully created an account!"
		else
			render 'new', flash: "Error!"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
		  redirect_to user_path(@user)
    else
      render :edit, flash: "Something went wrong!"
    end
	end

	def destroy
		User.find(session[:user_id]).destroy
		sessions.clear
		redirect_to root_url
	end
end
