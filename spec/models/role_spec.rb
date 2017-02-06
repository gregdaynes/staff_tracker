require 'rails_helper'

RSpec.describe Role, type: :model do
  subject {
    described_class.new(
      field: "developer"
    )
  }

  describe "validations" do
    it "valid with valid attributes" do
      expect(subject).to be_valid
    end 

    it "is not valid without field" do
      subject.field = nil
      expect(subject).to_not be_valid
    end
  end

end
