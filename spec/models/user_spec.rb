require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new
    @user.valid?
  end

  it "should be invalid if user has no email" do
    expect(@user.errors[:email]).to be_present
  end

  it "should be invalid if user has no password" do
    expect(@user.errors[:password]).to be_present
  end

  it "should be invalid if user has no confirm_password" do
    expect(@user.errors[:password_confirmation]).to be_present
  end

  it "should be invalid if user has no first_name" do
    expect(@user.errors[:first_name]).to be_present
  end

  it "should be invalid if user has no last_name" do
    expect(@user.errors[:last_name]).to be_present
  end

  it "should be invalid if password and password_confirmation do not match" do
    @user.password = "qwertyuiop"
    @user.password_confirmation = "asdfghjkl"
    @user.valid?
    expect(@user.errors[:password_confirmation]).to be_present
  end

  it "should be invalid if password is too short" do
    @user.password = "qwe"
    @user.password_confirmation = "qwe"
    @user.valid?
    expect(@user.errors[:password]).to be_present
  end

  describe "email, password, first_name, last_name, and password_confirmation are present" do

    before do
      @user.email = "test@gmail.com"
      @user.password = "qwertyuiop"
      @user.password_confirmation = "qwertyuiop"
      @user.first_name = "Bobby"
      @user.last_name = "Jones"
    end

    it "should be valid if all required fields are present" do
      expect(@user).to be_valid
    end

    describe "an account with duplicate fields is created" do

      before do
        @user.save!
        @user2 = User.new(
          password: "qwertyuiop",
          password_confirmation: "qwertyuiop",
          first_name: "Bobby",
          last_name: "Jones"
        )
      end

      it "should not allow duplicate emails" do
        @user2.email = "test@gmail.com"
        @user2.valid?
        expect(@user2.errors[:email]).to be_present
      end

      it "should not allow case-insensitive duplicate emails" do
        @user2.email = "TEST@gmail.com"
        @user2.valid?
        expect(@user2.errors[:email]).to be_present
      end

      it "should allow non-email credentials to be duplicate" do
        @user2.email = "test2@gmail.com"
        @user2.valid?
        expect(@user2).to be_valid
      end
    end
  end
end
