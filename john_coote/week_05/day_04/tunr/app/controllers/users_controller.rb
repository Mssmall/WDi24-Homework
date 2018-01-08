class UsersController < ApplicationController

  before_action :check_if_logged_in, :only => [:edit]
  def index
    @users = User.all # if lots of data look at will_paginate which is a gem
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user_id
      redirect_to root_path
    else
        render :new
    end
  end

  def edit
    # could have put the check if logged in function here. But more general is better.
    # leaves this edit function small andn clean.

    # option 1
    # redirect_to root_path unless @current_user.id == params[:id].to_i
    # @user = User.find params[:id]

    #option 2
    @user = @current_user


  end


  def update
    ## TOT+DO handle errors arising from validations...
    user = User.find params[:id]
    user.update user_params
    redirect_to root_path
    # you could make the user.update @current_user here
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
