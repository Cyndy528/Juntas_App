class SessionsController < ApplicationController
  def new
  	@signup_login_page = true
  	if current_user
  		redirect_to user_path(current_user)
  	end 
  end

  def create
  	@user = User.find_by_email(params[:email])
  		if @user && @user.authenticate(params[:password])
  			session[:user_id] = @user.id		
  		else 
				redirect_to user_path(current_user)
  		end
  end 

  def destroy
  	session[:usesr_id] = nil 
  	redirect_to root_path
  end

  private 

  def user_params 
  	params.require(:user).permit(:email, :password)
  end 
end





