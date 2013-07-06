class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :load_author

  private
    def load_author
      @author = User.first
    end
end
