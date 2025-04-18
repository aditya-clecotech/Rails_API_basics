class PostSerializer
  include JSONAPI::Serializer
  belongs_to :user
  attributes :id, :title, :description, :created_at
end
