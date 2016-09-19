class SessionsController < ApplicationController

  def new
    redirect_to root_path if current_user
  end

  def create
    if user = User.authenticate(params[:email], params[:password]) #Calling the method in user model
      session[:user_id] = user.id
      flash[:success] = "Sign in Successful"
      if session[:intended_destination]
        redirect_to session[:intended_destination]
        session[:intended_destination] = nil
      else
        redirect_to admin_base_index_path
      end
    else
      flash.now[:danger] = "Envalid Email or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:success] = "You have been Signed Out"
    redirect_to root_path
  end

end
