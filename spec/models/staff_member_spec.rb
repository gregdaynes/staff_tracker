require 'rails_helper'

RSpec.describe StaffMember, type: :model do
  subject { described_class.new }

  it "is valid when first_name is 2 or more characters" do
    subject.first_name = 'Al'
    expect(subject).to be_valid
  end

  it "is not valid when first_name is 1 or less characters" do
    subject.first_name = 'X'
    expect(subject).to_not be_valid
  end
end
