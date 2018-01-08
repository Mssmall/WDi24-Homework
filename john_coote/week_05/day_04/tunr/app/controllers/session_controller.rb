class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      redirect_to root_path
      session[:user_id] = user.id
    else
      flash[:error] = "Wrong email or username"
      redirect_to login_path
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
