class PasswordResetsController < ApplicationController

  def new
    #code
  end

  def create
    user = User.find_by(email: params[:email])

    if user
        OrderMailer.send_password_reset_link(user).deliver_now
        render template: '/password_resets/confirm_password_reset'
        false #stopping the render of the create template
    else
      flash[:danger] = params[:email].blank? ? "Email can't be blank." : "Invalid Email."
      redirect_to reset_password_path
    end
  end

  def edit
    @user = User.find_by(token: params[:id])
    redirect_to expired_token_path unless @user
  end

  def update
    @user = User.find_by(token: params[:id])

    if @user
      @user.password = params[:user][:password]
      @user.generate_token
      @user.save
      flash[:success] = "Password has been changed."
      redirect_to sign_in_path
    else
      redirect_to expired_token_path
    end
  end
end
