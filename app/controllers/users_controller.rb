class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update]  
before_action :admin_user,     only: [:destroy]

  def show
    @user=User.find(params[:id])
     if current_user.admin?
        render :layout =>"admin"
      else
        render :layout => "application"
      end
  end
  
  def index 
    @users = User.paginate(page: params[:page])
  end
  
  def new
  	@user = User.new
  end
  
    def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		redirect_to root_path
      flash[:success] = "Welcome to Airbook"
  	else
  		render 'new'
  	end
  end
  
  def edit
      @user = User.find(params[:id])
      if current_user.admin?
        render :layout =>"admin"
      else
        render :layout => "application"
      end
  end
  
   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    flash[:success] = "Profile updated"
    redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash.now[:success] = "User deleted"
    redirect_to users_url
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password,
  				 :password_confirmation)
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end
  def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    def not_logged_in
      redirect_to(root_url) if (current_user == nil)
    end
end
