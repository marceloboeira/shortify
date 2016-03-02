require "rails_helper"

RSpec.describe API::V1::Url do
  let(:params) { { link: "http://shopify.com/" } }
  let(:url) { Url.create(params) }

  describe "GET /api/urls/:id" do
    context "with valid id" do
      it "returns a url" do
        get "/api/urls/#{url.to_param}"

        expect(response.body).to match(/#{url.slug}/)
        expect(response.body).to match(/#{url.link}/)
      end
    end
  end
end
