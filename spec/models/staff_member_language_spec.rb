require 'rails_helper'

RSpec.describe StaffMemberLanguage, type: :model do
  subject { described_class.new( language: "Ruby" ) }

  it "is valid when valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid when language is empty" do
    subject.language = nil
    expect(subject).to_not be_valid
  end
end
