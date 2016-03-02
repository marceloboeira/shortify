class API < Grape::API
  format :json

  namespace :api do
    mount API::V1
  end
end
