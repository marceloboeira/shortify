class API < Grape::API
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  namespace :api do
    mount API::V1
  end

  rescue_from Mongoid::Errors::DocumentNotFound do |e|
    error!({ message: "not found" }, 404)
  end
end
