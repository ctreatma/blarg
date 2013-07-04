require 'spec_helper'

describe User do
  def valid_attributes
    { name: 'Test',
      email: 'test@example.com',
      password: 'test' }
  end

  context "when a user is created" do

    it "should have no errors with valid attributes" do
      u = User.new(valid_attributes)
      u.should be_valid
    end

    it "should require a name" do
      u = User.new(valid_attributes)
      u.name = nil
      u.should_not be_valid
      u.errors.should have_key :name
    end

    it "should require an email" do
      u = User.new(valid_attributes)
      u.email = nil
      u.should_not be_valid
      u.errors.should have_key :email
    end

    it "should require a password" do
      u = User.new(valid_attributes)
      u.password = nil
      u.should_not be_valid
      u.errors.should have_key :password
    end

    it "should hash the password" do
      u = User.new(valid_attributes)
      u.password_salt.should be_nil
      u.password_hash.should be_nil
      u.save
      u.password_salt.should_not be_nil
      u.password_hash.should_not be_nil
    end

  end    

end
