class UsersController < ApplicationController
  
  before_filter :authorize, only: [:edit, :update, :destroy]
  before_filter :get_user, except: [:new, :create, :index]
  
  def index
    @users = User.all
  end

  def create
    if !current_user
      updated_user_params = user_params 
    end
    @user = User.new(updated_user_params)
      if @user.save 
      session[:user_id] = @user.id 
        if user 
        redirect_to user_path(@user)
        else 
        redirect_to welcome_index
        end 
      end 
    end 

  def show
    if current_user 
      @user = User.find(params[:id])
    else 
      redirect_to welcome_index
  end
 end 

  def edit
    if current_user
      if current_user ==@user
        @user = current_user
      else 
        redirect_to user_path(current_user)
      end 
    else 
      redirect_to welcome_index
  end
end

  def update
    if current_user == @user 
      @user = current_user
      if @user.update_attributes(user_params)
        redirect_to user_path(@user)
      else 
        redirect_to edit_user_path
      end 
    end 
  end 

  def update
    if current_user == @user 
      if @user.destroy
        session[:user_id] = nil
        redirect_to root_path
      else
      redirect_to user_path(current_user) 
      end 
    end 
  end 

private 

  def user_params
    params.require(:user).permit(:full_name, :email, :avatar, :password, :interests, :bio, :slug)
  end 

  def get_user
    @user = User.find_by_id(params[:id])
  end 
end 

