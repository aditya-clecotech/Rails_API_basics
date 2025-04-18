class UserSerializer
  include JSONAPI::Serializer
  has_many :posts
  attributes :id, :email
end
