class PostsController < ApplicationController
  def index
    @posts = Post.published
  end

  def show
    @post = Post.published.find(params[:id])
  end

  def show_by_slug
    @post = Post.published.find_by slug: params[:slug]
    render 'show'
  end
end
