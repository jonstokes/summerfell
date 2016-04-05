require 'spec_helper'

RSpec.describe User, type: :model do
  context "validations" do
    subject { build(:user) }

    it "is valid" do
      expect(subject).to be_valid
    end

    it "requires email" do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it "requires passwords for a new record" do
      subject.password = nil
      expect(subject).not_to be_valid
    end

    it "does not require a password for an existing record" do
      subject.save
      user = User.first
      user.password = nil
      expect(user).to be_valid
    end
  end
end
