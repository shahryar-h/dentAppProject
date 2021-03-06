class UsersController < ApplicationController

  before_action :logged_in_user, only: [:new,:index, :edit, :update, :show, :destroy, :create]
  before_action :adminUser ,   only: [:edit, :update]
  before_action :admin_user ,   only: [:new, :index, :create, :destroy]

  def index

    @users = User.paginate(page: params[:page],:per_page => 6)
    
  end


  def show
    @user = User.find(params[:id])
  end


  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	flash[:success] = "New user created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end



  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :admin, :personel_number)
    end

    def user_params_UserEdit
      if current_user?(@user)
      params.require(:user).permit( :name, :email, :password,
                                   :password_confirmation, :admin, :personel_number)
    elsif current_user.admin?
        params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :admin, :personel_number)
      end
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

     def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    def adminUser

      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?

    end

end
