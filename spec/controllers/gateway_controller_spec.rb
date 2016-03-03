require "rails_helper"

RSpec.describe GatewayController, type: :controller do
  let(:url) { Url.create(original: "http://foo.com/bar/long") }

  context "when redirecting" do
    context "with a valid slug" do
      it "redirects shorten url to original link" do
        get(:redirect, slug: url.slug)

        expect(subject).to redirect_to(url.original)
      end

      it "responds with a `moved permanently` status" do
        get(:redirect, slug: url.slug)

        expect(response).to have_http_status(:moved_permanently)
      end
    end

    context "with an invalid slug" do
      it "responds with a `not found` status" do
        get(:redirect, slug: "invalid")

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
