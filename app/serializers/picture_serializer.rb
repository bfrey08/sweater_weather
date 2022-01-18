class PictureSerializer
  include JSONAPI::Serializer
  attributes :location, :image_url, :source, :author, :author_url
end
