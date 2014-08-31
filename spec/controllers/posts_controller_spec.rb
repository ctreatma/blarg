require 'spec_helper'

describe PostsController do

  describe 'GET "index"' do
    it 'should return a list posts' do
      post = Post.create(title: 'Test', content: 'Test content')
      get :index
      assigns(:posts).should eq([post])
    end
  end

  describe 'GET "show"' do
    it 'should return a single post' do
      post = Post.create(title: 'Test', content: 'Test content')
      get :show, id: post.id
      assigns(:post).should eq(post)
    end
  end

end
