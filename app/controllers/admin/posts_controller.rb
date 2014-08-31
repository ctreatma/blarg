module Admin
  class PostsController < ApplicationController
    before_filter :check_authentication

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to root_url, notice: 'Post created'
      else
        render 'new'
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])

      if @post.update_attributes(post_params)
        redirect_to root_url, notice: 'Post updated'
      else
        render 'edit'
      end
    end

    def destroy
    end

  private

    def check_authentication
      if session[:user_id].nil? || User.find(session[:user_id]).nil?
        redirect_to log_in_url
      end
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
end
