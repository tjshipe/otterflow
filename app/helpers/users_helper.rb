module UsersHelper
	def authorize
		redirect_to root_url, notice: "You do not have permission to do this!" if current_user.id != params[:id]
	end
end
