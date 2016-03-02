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
      it "return a serialized url" do
        get "/api/urls/#{url.to_param}"

        expect(json_response).to eq(default_response)
      end
    end

    context "with an invalid id" do
      it "return not found" do
        get "/api/urls/invalid_id"

        expect(response.code.to_i).to eq(404)
      end
    end
  end

  describe "POST /api/urls" do
    let(:default_response) {
      { "url" => {
        "id" => Url.last.to_param,
        "link" => Url.last.link,
        "slug" => Url.last.slug
        }
      }
    }

    context "with valid params" do
      it "insert the url" do
        expect{
          post("/api/urls", params)
        }.to change{ Url.count }.by(1)
      end

      it "return a serialized url" do
        post("/api/urls", params)

        expect(json_response).to eq(default_response)
      end

      context "with slug" do
        it "use the given slug" do
          post("/api/urls", params.merge(slug: "foo-bar"))

          expect(json_response["url"]["slug"]).to eq("foo-bar")
        end

        context "with repeated slug" do
          let(:slug_repeated_params) { params.merge(slug: "foo") }

          it "respond with validation message" do
            Url.create!(slug_repeated_params)

            post("/api/urls", slug_repeated_params)

            expect(json_response["errors"]).to include("slug" => ["is already taken"])
          end
        end
      end
    end

    context "with invalid params" do
      before do
        post("/api/urls", {})
      end

      it "return bad request" do
        expect(response.code.to_i).to eq(400)
      end

      it "respond with validation message" do
        expect(json_response).to eq("error" => "link is missing")
      end
    end
  end
end
