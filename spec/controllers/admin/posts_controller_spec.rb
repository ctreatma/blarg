require 'spec_helper'

describe Admin::PostsController do

  context "when the user is not logged in" do

    describe "GET 'new'" do
      it "should redirect to the login page" do
        get :new
        response.should redirect_to log_in_url
      end
    end

    describe "GET 'create'" do
      it "should redirect to the login page" do
        get :new
        response.should redirect_to log_in_url
      end
    end

    describe "GET 'edit'" do
      it "should redirect to the login page" do
        get :new
        response.should redirect_to log_in_url
      end
    end

    describe "GET 'update'" do
      it "should redirect to the login page" do
        get :new
        response.should redirect_to log_in_url
      end
    end

    describe "GET 'destroy'" do
      it "should redirect to the login page" do
        get :new
        response.should redirect_to log_in_url
      end
    end

  end

end
