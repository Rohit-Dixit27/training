class UserSerializer < ActiveModel::Serializer
  has_many :comments
  attributes :id, :name
end
