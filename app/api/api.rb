class API < Grape::API
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  namespace :api do
    mount API::V1
  end
end
