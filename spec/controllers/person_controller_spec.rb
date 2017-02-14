require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe "GET #index" do
    it "responds successfully with HTTP 200 status code"
    it "renders the template"
    it "loads all of the people into @people"
  end

  describe "GET #show" do
    it "responds successfully with HTTP 200 status code"
    it "renders the template"
    it "loads the person into @person"
  end

  describe "GET #new" do
    it "responds successfully with HTTP 200 status code"
    it "renders the template"
  end

  describe "GET #edit" do
    it "responds successfully with HTTP 200 status code"
    it "renders the template"
    it "loads the person into @person"
  end

  describe "POST #create" do
    it "changes person count by +1"
    it "responds successfully with HTTP 200 status code"
    it "renders the template"
    it "loads the person into @person"
  end

  describe "PATCH #update" do
    it "should update person"
    it "responds successfully with HTTP 200 status code"
    it "renders the template"
    it "loads the person into @person"
  end

  describe "DELETE #destroy" do
    it "changes person count by -1"
    it "responds successfully with HTTP 200 status code"
    it "renders the people#index template"
  end
end
