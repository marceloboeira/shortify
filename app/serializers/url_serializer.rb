class UrlSerializer < ActiveModel::Serializer
  attributes :id, :original, :slug, :short

  def id
    object.to_param
  end
end
