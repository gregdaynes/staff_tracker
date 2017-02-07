require 'rails_helper'

RSpec.describe StaffMember, type: :model do
  let(:user) {
    User.new(
      :first_name => "Gregory Daynes",
      :email => "greg@stembolt.com",
      :password => "abcd1234",
      :date_of_birth => Date.new(1986,11,04),
      :gender => "male"
    )
  }

  let(:role) {
    Role.new(
      :field => "developer"
    )
  }

  subject {
    described_class.new(
      pod: 1,
      started_at_company: DateTime.now,
      user: user,
      role: role
    )
  }

  describe "validations" do
    it "valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not be valid without pod" do
      subject.pod = nil
      expect(subject).to_not be_valid
    end

    it "is not be valid without start date" do
      subject.started_at_company = nil
      expect(subject).to_not be_valid
    end
  end

  describe "associations" do 
    it { should belong_to(:user) }
    it { should belong_to(:role) }
  end

end
