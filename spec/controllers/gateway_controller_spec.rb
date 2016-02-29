require "rails_helper"

RSpec.describe GatewayController, type: :controller do
  let(:url) { Url.create(link: "http://foo.com/bar/long") }

  context "when redirecting" do
    context "with a valid slug" do
      it "redirect shorten url to original link" do
        get(:redirect, slug: url.slug)

        expect(subject).to redirect_to(url.link)
      end

      it "respond with `moved permanently` status" do
        get(:redirect, slug: url.slug)

        expect(response.code.to_i).to eq(301)
      end
    end

    context "with an invalid slug" do
      it "respond with a `not found` status" do
        get(:redirect, slug: "invalid")

        expect(response.code.to_i).to eq(404)
      end
    end
  end
end
