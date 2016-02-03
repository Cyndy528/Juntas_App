class InterestsController < ApplicationController
  
  def show
    if current_user 
      @interest = Interest.find_by_id(params[:id])
      @user = User.find_by_id(params[:id])
     
    else 
      redirect_to user_path
    end
  end 

  private 

    def user_params
      params.require(:user).permit(:full_name, :email, :avatar, :password, :bio)
    end 

    def get_user
      @user = User.find_by_id(params[:id])
    end 

 
end

 