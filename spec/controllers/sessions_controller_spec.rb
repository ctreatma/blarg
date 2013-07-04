require 'spec_helper'

describe SessionsController do
  before :each do
    @user = User.create(name: 'Test', email: 'test@example.com', password: 'abcd')
  end

  describe "GET 'new'" do
    it "should render login form" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST 'create'" do
    
    context "when authentication is successful" do
      it "should set the session user" do
        post :create, email: @user.email, password: @user.password
        session[:user_id].should eq(@user.id)
      end

      it "should redirect to posts" do
        post :create, email: @user.email, password: @user.password
        response.should redirect_to posts_url
      end
    end

    context "when authentication fails" do
      it "should render login form" do
        post :create
        response.should render_template :new
      end
    end
  end

  describe "GET 'destroy'" do
    it "should unset the session user" do
      session[:user_id] = 1
      get :destroy
      session[:user_id].should be_nil
    end

    it "should redirect to the root url" do
      get :destroy
      response.should redirect_to root_url
    end
  end

end
