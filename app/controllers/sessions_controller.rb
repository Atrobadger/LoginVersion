class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(emailaddress: params[:session][:emailaddress])
    if user 
      log_in user
      redirect_to profile_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
