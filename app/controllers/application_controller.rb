class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper

  def authorize
    redirect_to root_url, notice: "You do not have permission to do this!" if current_user.id != params[:id]
  end

  def authenticate
    current_user
  end
end
