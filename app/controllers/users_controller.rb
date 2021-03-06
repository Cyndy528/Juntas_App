class UsersController < ApplicationController
  
  before_filter :authorize, only: [:edit, :update, :destroy]
  before_filter :get_user, except: [:new, :create, :index]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end 

  def create
    if !current_user
      @user = User.new(user_params)
      if @user.save 
        if params[:interests].present? 
          params[:interests].each do |i|
            interest = Interest.find_by(name: i)
            unless @user.interests.include? interest
              @user.interests << interest
            end 
          end 
        end 
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
      else 
        flash[:error] = @user.errors.full_messages.join(", ")
        redirect_to signup_path 
      end 
    end  
  end  

  def show
    if current_user 
      @user = User.find(params[:id])
    else 
      redirect_to root_path
    end
  end 

  def edit
    if current_user 
      if current_user == @user
        @user = current_user
    else 
      redirect_to user_path(current_user)
    end 
    else
      redirect_to root_path
    end 
  end 

  def update
    if current_user == @user
      @user = current_user
      if @user.update_attributes(user_params)
        if params[:interests].present? 
          params[:interests].each do |i|
            interest = Interest.find_by(name: i)
            unless @user.interests.include? interest
              @user.interests << interest
            end 
          end
        end 
        redirect_to user_path(@user)
        flash[:notice] = "Your profile has been updated!"
      else 
        flash[:error] = @user.error.full_messages.join(", ")
        redirect_to edit_user_path
      end
    end
  end 

  def destroy 
    if current_user == @user
       @user.destroy
       flash[:notice] = "Your Account has been deleted"
        session[:user_id] = nil
        redirect_to root_path
    end 
  end
 
  private 

    def user_params
      params.require(:user).permit(:full_name, :email, :avatar, :password, :bio)
    end 

    def get_user
      @user = User.find_by_id(params[:id])
    end 

    def interest
      params.require(:interests).permit(:name)
    end 
end 