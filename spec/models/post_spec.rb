require 'spec_helper'

describe Post do
  def valid_attributes
    { title: 'Test', content: 'Test content' }
  end

  context 'when a post is created' do

    before :each do
      @p = Post.new(valid_attributes)
    end

    it 'should not have errors for valid attributes' do
      @p.should be_valid
    end

    it 'should require a title' do
      @p.title = nil
      @p.should_not be_valid
      @p.errors.should have_key :title
    end

    it 'should require content' do
      @p.content = nil
      @p.should_not be_valid
      @p.errors.should have_key :content
    end

    it 'should generate a slug from the title' do
      @p.title = 'Title of post'
      @p.save
      @p.slug.should be_eql @p.title.to_url
    end

    it 'should not be published' do
      @p.published_at.should be_nil
      @p.should_not be_published
    end
  end

  context 'when a post is published' do
    before :each do
      @frozen_time = Time.now
      Time.stub(:now).and_return(@frozen_time)
      @p = Post.new
      @p.publish
    end

    it 'should have a published_at date' do
      @p.published_at.should be == @frozen_time
    end

    it 'should return true for #published?' do
      @p.should be_published
    end
  end
end
