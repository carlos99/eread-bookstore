class SessionsController < ApplicationController

  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Sign in Successful"
      redirect_to root_path
    else
      flash[:danger] = "Envalid Email or Password"
      render :new
    end
  end

end
