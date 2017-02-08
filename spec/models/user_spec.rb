# spec/models/user_spec.rb
require "rails_helper"

describe User do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryGirl.create(:user)).to be_valid
    end

    it "is invalid without first_name" do
      expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid
    end

    it "is invalid when first_name is one character" do
      expect(FactoryGirl.build(:user, first_name: "a")).to_not be_valid
    end

    it "is invalid without email" do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end

    it "is invalid without valid email" do
      expect(FactoryGirl.build(:user, email: "john.doe@example")).to_not be_valid
    end

    it "is invalid when email is not unique"

    it "is invalid without password" do 
      expect(FactoryGirl.build(:user, password: nil)).to_not be_valid 
    end

    it "is invalid with short password" do
      expect(FactoryGirl.build(:user, password: "secure")).to_not be_valid
    end

    it "is invalid without date_of_birth" do
      expect(FactoryGirl.build(:user, date_of_birth: nil)).to_not be_valid
    end

    it "is invalid when date_of_birth is not a date" do
      expect(FactoryGirl.build(:user, date_of_birth: "abc123")).to_not be_valid
    end

    it "is invalid without gender" do
      expect(FactoryGirl.build(:user, gender: nil)).to_not be_valid
    end
  end

  describe "outputs" do
    it "returns a contact with full_name" do
      contact = FactoryGirl.build(:user, first_name: "John", last_name: "Doe")
      expect(contact.full_name).to eq "John Doe"
    end
  end

  describe "associations" do 
    it { should have_many(:skills) }
    it { should have_many(:languages) }
  end
end
