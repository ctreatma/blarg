class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def show_by_slug
    @post = Post.find_by slug: params[:slug]
    render 'show'
  end
end
