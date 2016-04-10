require 'spec_helper'

RSpec.describe Package, type: :model do
  context "Validations" do
    subject { create(:package) }

    it "requires name" do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it "requires description" do
      subject.description = nil
      expect(subject).not_to be_valid
    end

    it "requires charged_as" do
      subject.charged_as = nil
      expect(subject).not_to be_valid
    end

    it "requires requires price_cents" do
      subject.price_cents = nil
      expect(subject).not_to be_valid
    end

    it "requires price_cents to be a non-negative integer" do
      subject.price_cents = -3
      expect(subject).not_to be_valid
    end

    it "requires currency to be USD" do
      subject.currency = 'ABC'
      expect(subject).not_to be_valid

      subject.currency = nil
      expect(subject).not_to be_valid
    end

    it "requires duration_minutes to be a non-negative integer" do
      subject.duration_minutes = nil
      expect(subject).not_to be_valid

      subject.duration_minutes = -2
      expect(subject).not_to be_valid
    end

    it "does not require limit_up" do
      subject.limit_up = nil
      expect(subject).to be_valid
    end

    it "requires limit_up to be a non-negative integer" do
      subject.limit_up = -2
      expect(subject).not_to be_valid
    end

    it "does not require limit_down" do
      subject.limit_down = nil
      expect(subject).to be_valid
    end

    it "requires limit_down to be a non-negative integer" do
      subject.limit_down = -2
      expect(subject).not_to be_valid
    end

    it "does not require limit_quota" do
      subject.limit_quota = nil
      expect(subject).to be_valid
    end

    it "requires limit_quota to be a non-negative integer" do
      subject.limit_quota = -2
      expect(subject).not_to be_valid
    end
  end

  context "scopes" do
    before do
      create(:package, price_cents: 0)
      create(:package, price_cents: 100)
    end

    describe "free" do
      it "only returns free plans" do
        expect(Package.free.count).to eq(1)
      end
    end

    describe "paid" do
      it "only returns paid plans" do
        expect(Package.paid.count).to eq(1)
      end
    end
  end

  describe "#free?" do
    let(:free) { create(:package, price: 0) }
    let(:paid) { create(:package, price: 100) }

    it "returns true if the package is free, false if paid" do
      expect(free.free?).to eq(true)
      expect(paid.free?).to eq(false)
    end
  end
end
