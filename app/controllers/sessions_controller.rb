class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def index
  end

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      user.update_column(:is_online, true)
      session[:user_id] = user.id
      flash[:success] = "successfully login"
      redirect_to root_path
      ActionCable.server.broadcast "chatroom_channel", 
                                    flag: "create",
                                    user: user
      # respond_to do |format|
      #   format.js
      #   # format.html { redirect_to root_path}
      # end
    else
      flash.now[:error] = "something incorrect"
      render 'new'
    end
  end

  def destroy
    current_user.update_column(:is_online, false)
    ActionCable.server.broadcast "chatroom_channel", 
                                    flag: "destroy",
                                    user: current_user
    session[:user_id] = nil
    flash[:success] = "successfully logged out"
    redirect_to login_path
    # respond_to do |format|
    #   format.js{redirect_to login_path}
    # end
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end

end
