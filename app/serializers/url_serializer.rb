class UrlSerializer < ActiveModel::Serializer
  attributes :id, :original, :slug

  def id
    object.to_param
  end
end
