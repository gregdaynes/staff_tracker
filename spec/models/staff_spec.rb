require 'rails_helper'

RSpec.describe Staff, type: :model do
  let!(:person) {
    Person.new(
      first_name: 'Gregory',
      last_name: 'Daynes',
      email: 'greg@stembolt.com',
      password: 'abc123',
      password_confirmation: 'abc123',
      date_of_birth: Date.new(1986,11,04),
      gender: 'Male'
    )
  }

  subject {
    described_class.new(
      pod: 1,
      started_at_company: Date.new(2017,02,01),
      person: person
    )
  }

  describe "validations" do
    it "expects valid attributes" do
      expect(subject).to be_valid
    end
    it "expects pod" do
      subject.pod = nil
      expect(subject).to_not be_valid
    end
    it "expects started_at_company" do
      subject.started_at_company = nil
      expect(subject).to_not be_valid
    end

    it "accepts started_at_company as a Date" do
      expect(subject).to be_valid
    end
    it "accepts started_at_company as a String" do
      subject.started_at_company = '2017/02/01'
      expect(subject).to be_valid
    end
  end

  describe "associations" do
    it "should belong to person"
  end

  describe "extra properties" do
    it "generates time_at_company" do
      expect(subject.time_at_company[:days]).to satisfy { |v| v >= 0 }
      expect(subject.time_at_company[:hours]).to satisfy { |v| v >= 0 }
    end
  end
end
