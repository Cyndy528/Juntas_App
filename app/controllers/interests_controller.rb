class InterestsController < ApplicationController
  
  def show
    if current_user 
      @interest = Interest.find_by_id(params[:id])
    else 
      redirect_to user_path
    end
  end 

  private 

  	def user_params
      params.require(:interest).permit(:name)
    end

end

 