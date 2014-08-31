class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])

    if user.nil?
      flash.now.alert = 'Could not log in'
      render 'new'
    else
      session[:user_id] = user.id
      redirect_to posts_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
