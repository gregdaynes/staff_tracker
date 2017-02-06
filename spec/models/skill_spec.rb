require 'rails_helper'

RSpec.describe Skill, type: :model do
  subject {
    described_class.new(
      title: "frontend"
    )
  }

  describe "validations" do
    it "valid with valid attributes" do
      expect(subject).to be_valid
    end 

    it "is not valid without title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end

end
