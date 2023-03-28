class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at, :name, :role
end
