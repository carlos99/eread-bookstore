class PasswordResetsController < ApplicationController

  def new
    #code
  end

  def create
    user = User.find_by(email: params[:email])

    if user
        OrderMailer.send_password_reset_link(user).deliver_now
        render template '/password_resets/confirm_password_reset'
        false
    else
      flash[:danger] = params[:email] ? "Invalid Email." : "Email can't be blank."
      redirect_to reset_password_path
    end
  end
end
