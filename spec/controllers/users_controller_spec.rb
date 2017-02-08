require 'rails_helper'

describe UsersController do

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new @user in the database"
      it "returns the new @user"
    end

    context "with invalid attributes" do
      it "does not save the new @user in the database"
      it "returns an json object with error message"
      it "has an error code of 400"
    end
  end

  describe "GET #index" do
    it "populates an array of users"
    it "returns a json array of users"
  end

  describe "GET #show" do
    it "assigns the requested user to @user"
    it "returns a json object of @user"
  end

  describe "UPDATE #edit" do
    context "with valid attributes" do
      it "updates the existing @user in the database"
      it "returns the updated @user"
    end

    context "with invalid attributes" do
      it "does not save changes to the existing @user in the database"
      it "returns an json object with error message"
      it "has an error code of 400"
    end
  end

  describe "DELETE #destroy" do
    it "deletes the @user from the database"
    it "returns 200"
  end

end
