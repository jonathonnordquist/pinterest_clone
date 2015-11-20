class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user_pins_page_path(user.id)
    else
      flash.now[:danger] = "Username or password is incorrect."
      render 'new'
    end
  end
  
  def destroy
    logout
    redirect_to root_path
  end
end
