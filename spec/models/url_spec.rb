require "rails_helper"

RSpec.describe Url, type: :model do
  context "validates" do
    context "presence of" do
      let(:url) { Url.new }

      it "original" do
        expect(url).to_not be_valid
        expect(url.errors[:original]).to eq(["can't be blank"])
      end

      it "slug" do
        url.slug = nil

        expect(url).to_not be_valid
        expect(url.errors[:slug]).to eq(["can't be blank"])
      end
    end
  end

  context "when creating" do
    let!(:url) { Url.create(params) }

    context "and slug is nil" do
      let(:params) { { original: "http://foo.bar" } }

      it "generates slug" do
        expect(url.slug).to_not be_nil
      end
    end

    context "and slug is not nil" do
      let(:params) { { original: "http://foo.bar", slug: "foo" } }

      it "uses the given slug" do
        expect(url.slug).to eq("foo")
      end

      context "and there is already a slug like it" do
        it "generates a uniqueness error" do
          repeated_url = Url.new(params)

          expect(repeated_url).to_not be_valid
          expect(repeated_url.errors[:slug]).to include("is already taken")
        end
      end
    end
  end

  describe "short url" do
    let(:url) { Url.create(slug: "foo") }

    it "returns a full url" do
      expect(url.short).to eq("#{Settings.host}/foo")
    end
  end
end
