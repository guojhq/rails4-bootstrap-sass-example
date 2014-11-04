class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user and @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: "Welcome back #{@user.name}" }
    else
      flash.now[:danger] = 'Invalid email and password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id) if logged_in?
    redirect_to root_path, flash: { success: 'Logged out!' }
  end
end