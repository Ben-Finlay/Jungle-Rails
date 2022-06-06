require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "Should create a new user if there is a password, and that it matches password_confirmation" do
      @user = User.new(fname: "test", lname: "alsotest", email: "test@test.com", password: "test", password_confirmation: "test")
      @user.save!
      expect(@user).to be_present
    end

    it "Should not save if passwords fields aren't matching" do
      @user = User.new(fname: "test", lname: "alsotest", email: "test@test.com", password: "test", password_confirmation: "test1")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "Should only save if a password is present" do
      @user = User.new(fname: "test", lname: "alsotest", email: "test@test.com", password: "", password_confirmation: "")
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "Emails for new users should be unique" do
      @user1 = User.new(fname: "test", lname: "alsotest", email: "test@test.com", password: "test", password_confirmation: "test")
      @user2 = User.new(fname: "test", lname: "alsotest", email:"test@test.com", password: "test1", password_confirmation: "test1")
      @user1.save
      @user2.save
      expect(@user1).to be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
      expect(@user2).not_to be_valid
    end

    it "Emails for new users should be unique and case sensitive" do
      @user1 = User.new(fname: "test", lname: "alsotest", email: "test@test.com", password: "test", password_confirmation: "test")
      @user2 = User.new(fname: "test", lname: "alsotest", email:"TEST@test.com", password: "test1", password_confirmation: "test1")
      @user1.save
      @user2.save
      expect(@user1).to be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
      expect(@user2).not_to be_valid
    end


    it "Should not save if no first name" do
      @user = User.new(lname: "test", email: "test@test.com", password: "test", password_confirmation: "test")
      @user.save
      expect(@user.errors.full_messages).to include("Fname can't be blank")
    end

    it "Should not save if no last name" do
      @user = User.new(fname: "test", email: "test@test.com", password: "test", password_confirmation: "test")
      @user.save
      expect(@user.errors.full_messages).to include("Lname can't be blank")
    end

    it "Should not save if the password is less than 4 characters" do      
      @user = User.new(fname: "test", lname: "alsotest", email: "test@test.com", password: "tes", password_confirmation: "tes")
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end

  end


  describe "Authentication" do
    before(:each) do
    @email = "test@test.com"
    @password = "test"
    @user = User.create(fname: "Tester", lname: "McTest", email: @email, password: @password, password_confirmation: @password)
    end


      it "Should still authenticate if there are spaces before or after entered email" do
        @user = User.authenticate_with_credentials("   test@test.com    ", @password)
      expect(@user).to be_a(User)
      end

      it "Should still authenticate if the email is entered with the wrong case" do
        @user = User.authenticate_with_credentials("teST@test.COM", @password)
      expect(@user).to be_a(User)
      end

    end
end

