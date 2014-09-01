require 'spec_helper'

describe PostsController do

  before :each do
    @published_post = Post.create(title: 'Published Test',
                                  content: 'Published test content',
                                  published_at: Time.now)
    @unpublished_post = Post.create(title: 'Unpublished Test',
                                    content: 'Unpublished test content')
  end

  describe 'GET "index"' do
    it 'should return a list of published posts' do
      get :index
      assigns(:posts).should eq([@published_post])
    end
  end

  describe 'GET "show"' do
    context 'when given a published post ID' do
      before :each do
        get :show, id: @published_post.id
      end

      it 'should return a single post' do
        assigns(:post).should eq(@published_post)
      end
    end

    context 'when given an unpublished post ID' do
      it 'should raise an error' do
        expect do
          get :show, id: @unpublished_post.id
        end.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe 'GET "show_by_slug"' do
    context 'when given a published post slug' do
      before :each do
        get :show_by_slug, slug: @published_post.slug
      end

      it 'should return a single post' do
        assigns(:post).should eq(@published_post)
      end
    end

    context 'when given an unpublished post ID' do
      it 'should return nil' do
        get :show_by_slug, slug: @unpublished_post.slug
        assigns(:post).should be_nil
      end
    end
  end

end
