require 'spec_helper'

RSpec.describe Guest, type: :model do
  context "Validations" do
    subject { create(:guest) }

    it "requires device_address" do
      subject.device_address = nil
      expect(subject).not_to be_valid
    end

    it "requires device_address to be a valid MAC address" do
      subject.device_address = "ABC"
      expect(subject).not_to be_valid
    end

    it "requires access_point_address" do
      subject.access_point_address = nil
      expect(subject).not_to be_valid
    end

    it "requires access_point_address to be a valid MAC address" do
      subject.access_point_address = "ABC"
      expect(subject).not_to be_valid
    end

    it "requires package_id" do
      subject.package_id = nil
      expect(subject).not_to be_valid
    end
  end
end
