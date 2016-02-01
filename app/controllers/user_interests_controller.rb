class UserInterestsController < ApplicationController
	def index
	end

	def create
   interests = Interest.where(id: params[:user][:interest_ids])
   current_user.interests.push(interests)
   flash[:success] = "Interests updated!"
   redirect_to current_user
	end

	def destroy
	  @user_interest = UserInterest.find(params[:user_id][:interest_ids])
	  current_user.user_interests(@user_interest).destroy
	end

	def new
		@interest = current_user.interests.new
		@user = current_user
	end
	
end 

