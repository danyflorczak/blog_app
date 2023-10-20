require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { described_class.new }
  describe "validations" do
    it "is valid with valid attributes" do
      subject.title = Faker::Name
      subject.body = Faker::Name
      expect(subject).to be_valid
    end
    it "is not valid without title" do
      subject.body = Faker::Name
      expect(subject).not_to be_valid
    end
    it "is not valid without body" do
      subject.title = Faker::Name
      expect(subject).not_to be_valid
    end
  end
end
