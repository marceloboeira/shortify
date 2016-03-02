require "rails_helper"
require "support/json_response"

class API < Grape::API
  get :document_not_found do
    raise Mongoid::Errors::DocumentNotFound.new(Url, foo: "bar")
  end
end

RSpec.describe API do
  it "rescues from Mongo::Errors::NotFound with default JSON" do
    get "/document_not_found"

    expect(response.status).to eq(404)
    expect(json_response).to eq("message" => "not found")
  end
end
