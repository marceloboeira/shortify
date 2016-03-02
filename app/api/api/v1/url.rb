class API::V1::Url < Grape::API
  resources :urls do
    params do
      requires :id, type: String
    end
    get ":id" do
      ::Url.find(params[:id])
    end

    params do
      requires :link, type: String
    end
    post do
      ::Url.create(params.to_h)
    end
  end
end
