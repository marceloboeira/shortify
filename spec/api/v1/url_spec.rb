require "rails_helper"
require "support/json_response"

RSpec.describe API::V1::Url do
  let(:default_params) { { original: "http://foo" } }
  let(:default_response) {
    { "url" => {
      "id" => Url.last.to_param,
      "original" => Url.last.original,
      "slug" => Url.last.slug,
      "short" => Url.last.short }
    }
  }

  describe "GET /api/urls/:id" do
    let(:url) { Url.create(default_params) }

    context "with a valid id" do
      it "returns a serialized url" do
        get "/api/urls/#{url.to_param}"

        expect(json_response).to eq(default_response)
      end

      it "returns success" do
        get "/api/urls/#{url.to_param}"

        expect(response).to be_success
      end
    end

    context "with an invalid id" do
      it "returns not found" do
        get "/api/urls/invalid_id"

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST /api/urls" do
    context "with valid params" do
      it "inserts a url" do
        expect{
          post("/api/urls", default_params)
        }.to change{ Url.count }.by(1)
      end

      it "returns a serialized url" do
        post("/api/urls", default_params)

        expect(json_response).to eq(default_response)
      end

      context "with slug" do
        it "uses the given slug" do
          post("/api/urls",  default_params.merge(slug: "foo-bar"))

          expect(json_response["url"]["slug"]).to eq("foo-bar")
        end

        context "with repeated slug" do
          let(:slug_repeated_params) { default_params.merge(slug: "foo") }

          it "responds with validation message" do
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

      it "returns bad request" do
        expect(response.code.to_i).to eq(400)
      end

      it "responds with validation message" do
        expect(json_response).to eq("error" => "original is missing")
      end
    end
  end

  describe "PUT /api/urls/:id" do
    let(:update_params) { { original: "http://bar" } }
    let(:url) { Url.create(default_params) }

    context "with valid params" do
      it "updates the url" do
        expect{
          put("/api/urls/#{url.to_param}", update_params)
        }.to change{ url.reload.original }.to(update_params[:original])
      end

      it "returns success" do
        put("/api/urls/#{url.to_param}", update_params)

        expect(response).to be_success
      end

      it "returns a serialized url" do
        put("/api/urls/#{url.to_param}", update_params)

        expect(json_response).to eq(default_response)
      end
    end

    context "with invalid params" do
      let(:update_params) { { original: ["invalid", "original"] } }

      before do
        put("/api/urls/#{url.to_param}", update_params)
      end

      it "returns bad request" do
        expect(response).to have_http_status(:bad_request)
      end

      it "responds with validation message" do
        expect(json_response).to eq("error" => "original is invalid")
      end
    end
  end
end
