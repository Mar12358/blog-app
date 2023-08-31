class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :email, :role
end
