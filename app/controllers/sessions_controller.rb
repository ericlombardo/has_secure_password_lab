class SessionsController < ApplicationController

  def create
    user = User.find_by_name(params[:user][:name]) # find user instance
    if user && user.authenticate(params[:user][:password])  # if instance found and password matches
      session[:user_id] = user.id # set session[:user_id]
    end

  end

  private

  def session_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
