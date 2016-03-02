require "rails_helper"
require "support/json_response"

RSpec.describe API::V1::Url do
  let(:params) { { link: "http://shopify.com/" } }

  describe "GET /api/urls/:id" do
    let(:url) { Url.create(params) }
    let(:default_response) {
      { "url" => {
          "id" => url.to_param,
          "link" => url.link,
          "slug" => url.slug
        }
      }
    }

    context "with a valid id" do
      it "returns a url" do
        get "/api/urls/#{url.to_param}"

        expect(json_response).to eq(default_response)
      end
    end
  end
end
