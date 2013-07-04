require 'spec_helper'

describe Post do
  def valid_attributes
    { title: 'Test', content: 'Test content' }
  end

  context "when a post is created" do

    before :each do
      @p = Post.new(valid_attributes)
    end

    it "should not have errors for valid attributes" do
      @p.should be_valid
    end

    it "should require a title" do
      @p.title = nil
      @p.should_not be_valid
      @p.errors.should have_key :title
    end

    it "should require content" do
      @p.content = nil
      @p.should_not be_valid
      @p.errors.should have_key :content
    end

  end

end
