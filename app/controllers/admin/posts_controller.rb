class Admin::PostsController < ApplicationController
  before_filter :check_authentication

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def check_authentication
    if session[:user_id].nil? || User.find(session[:user_id]).nil?
      redirect_to log_in_url
    end
  end
end
