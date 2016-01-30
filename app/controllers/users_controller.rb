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
      updated_user_params = user_params 
    end
    @user = User.new(updated_user_params)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      redirect_to root_path 
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
    @user = User.find(params[:id])
    if current_user == @user
      render :edit
    else 
      redirect_to root_path
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

  def destroy 
    if current_user == @user
       @user.destroy
        session[:user_id] = nil
        redirect_to root_path
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
