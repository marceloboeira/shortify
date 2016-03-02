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

  describe "slug behavior" do
    let!(:url) { Url.create(params) }
    context "when slug is nil" do
      let(:params) { { link: "http://foo.bar" } }

      it "generate slug" do
        expect(url.slug).to_not be_nil
      end
    end

    context "when slug is not nil" do
      let(:params) { { link: "http://foo.bar", slug: "foo" } }

      it "use the given slug" do
        expect(url.slug).to eq("foo")
      end

      context "and there is already a slug like it" do
        it "generate a uniqueness error" do
          repeated_url = Url.new(params)

          expect(repeated_url).to_not be_valid
          expect(repeated_url.errors[:slug]).to include("is already taken")
        end
      end
    end
  end
end
