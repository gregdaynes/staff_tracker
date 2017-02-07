require 'rails_helper'

RSpec.describe User, type: :model do
  subject { 
    described_class.new(
      first_name: "John",
      last_name: "Doe",
      email: "john@example.com",
      password: "abcd1234",
      date_of_birth: Date.new(1980,01,01),
      gender: "male"
    )
  }

  it "is valid when valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid when first_name is empty" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid when first_name is one character" do 
    subject.first_name = 'a'
  end

  it "is not valid when email is empty" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid when email is not an email" do
    subject.email = "test@example"
    expect(subject).to_not be_valid
  end

  it "is not valid if an email already exists"

  it "is not valid when password is empty" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid when password is less than 8 characters" do
    subject.password = '1234567'
    expect(subject).to_not be_valid
  end

  it "is not valid when date_of_birth is not set" do
    subject.date_of_birth = nil
    expect(subject).to_not be_valid
  end

  it "is not valid when date_of_birth is not a date" do
    subject.date_of_birth = "banana"
    expect(subject).to_not be_valid
  end

  it "is not valid when gender is empty" do
    subject.gender = nil
    expect(subject).to_not be_valid
  end

  describe "validations" do 
    it { should have_many(:skills) }
    it { should have_many(:languages) }
  end
end
