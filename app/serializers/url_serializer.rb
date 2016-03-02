class UrlSerializer < ActiveModel::Serializer
  attributes :id, :link, :slug

  def id
    object.to_param
  end
end
