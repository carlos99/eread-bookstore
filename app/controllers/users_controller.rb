class UsersController < ApplicationController
  before_action :require_sign_in, only: [:index]
  before_action :require_admin, only: [:index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @user.addresses.build #"making fields availables to the views"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = "User has been created"
      redirect_to sign_in_path
    else
      flash.now[:danger] = "User has not been created"
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash.now[:success] = "User has been updated"
      redirect_to @user
    else
      flash.now[:danger] = "User has not been updated"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User has been deleted"
    redirect_to users_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, addresses_attributes: [:address_line1, :address_line2, :city, :zipcode])
    end

end
