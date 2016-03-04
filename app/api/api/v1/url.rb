class API::V1::Url < Grape::API
  resources :urls do
    params do
      requires :id, type: String
    end
    get ":id" do
      ::Url.find(params[:id])
    end

    params do
      requires :original, type: String
      optional :slug, type: String
    end
    post do
      url = ::Url.new(params.to_h)

      if !url.save
        error!({ errors: url.errors }, 403)
      end

      url
    end

    params do
      requires :id, type: String
      optional :original, type: String
      optional :slug, type: String
    end
    put ":id" do
      url = ::Url.find(params[:id])

      if !url.update(params.to_h)
        error!({ errors: url.errors }, 403)
      end

      url
    end

    params do
      requires :id, type: String
    end
    delete ":id" do
      url = ::Url.find(params[:id])

      url.delete
    end
  end
end
