require "rails_helper"

RSpec.describe Url, type: :model do
  context "validates" do
    context "presence of" do
      let(:url) { Url.new }

      it "link" do
        expect(url).to_not be_valid
        expect(url.errors[:link]).to eq(["can't be blank"])
      end

      it "slug" do
        url.slug = nil

        expect(url).to_not be_valid
        expect(url.errors[:slug]).to eq(["can't be blank"])
      end
    end
  end

  context "defaults" do
    it "generates slug" do
      expect(Url.new.slug).to_not be_nil
    end
  end
end
